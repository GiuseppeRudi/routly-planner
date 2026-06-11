from __future__ import annotations
from pathlib import Path
import argparse
import sys
import random
import re
import json

PROJECT_ROOT = Path.cwd()
sys.path.insert(0, str(PROJECT_ROOT))
from src.routly.config import load_config
from src.routly.features import FeatureConfig
from src.routly.llm_client import call_llm

def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Inject road incidents via Manual Input or LLM.")
    parser.add_argument("--map-config", required=True)
    parser.add_argument("--project-config", required=True)
    parser.add_argument("--features-config", required=True)
    return parser.parse_args()

def main() -> None:
    args = parse_args()
    config = load_config(args.map_config, args.project_config)
    rng = random.Random(config.seed)

    base_problem_path = config.problem_path
    dynamic_problem_path = base_problem_path.parent / "problem_dynamic.pddl"

    # 1. Leggiamo il file di problema originale
    with open(base_problem_path, "r", encoding="utf-8") as f:
        content = f.read()

    # 2. Estraiamo tutte le strade aperte disponibili nel problema
    all_roads = re.findall(r"\(road-open\s+(road_\d+)\)", content)

    if not all_roads:
        print("❌ Nessuna strada aperta trovata nel file PDDL base!")
        sys.exit(1)

    # 3. Gestione Input Manuale / Scelta LLM
    print("\n" + "=" * 70)
    print("🚧 CONFIGURAZIONE EVENTO DINAMICO")
    print("=" * 70)
    manual_road = input("Inserisci l'ID di una strada da chiudere (es. road_0013)\no premi INVIO per lasciare la scelta all'LLM: ").strip()
    print("-" * 70)

    selected_road = None
    descrizione = ""

    if manual_road:
        if manual_road in all_roads:
            selected_road = manual_road
            descrizione = "Chiusura manuale forzata dall'utente per test di re-routing."
            print(f"🎯 Modalità: TEST MANUALE DETERMINISTICO")
        else:
            print(f"❌ La strada '{manual_road}' non esiste o è già chiusa nel file PDDL.")
            print("➔ Ripiego sulla generazione casuale tramite LLM...")
            manual_road = ""

    # Se non è stato inserito un input manuale valido, interroghiamo l'LLM
    if not manual_road:
        print(f"🔮 Modalità: GENERAZIONE STOCASTICA (LLM)")
        sample_roads = rng.sample(all_roads, min(5, len(all_roads)))
        print(f"  ↳ Campione inviato all'LLM per la scelta: {sample_roads}")

        prompt = (
            f"Sei un generatore di imprevisti stradali per la città di Bologna.\n"
            f"Scegli esattamente UNA strada da questo elenco per simulare un incidente o un cantiere: {sample_roads}.\n"
            f"Rispondi tassativamente in questo formato JSON, senza altro testo prima o dopo:\n"
            f"{{\n"
            f"  \"selected_road\": \"road_XXXX\",\n"
            f"  \"event_description\": \"Breve descrizione di cosa è successo in italiano\"\n"
            f"}}"
        )

        try:
            response_text = call_llm(prompt, backend=features.llm_events.backend)
            response_text = re.sub(r"```json|```", "", response_text).strip()
            llm_decision = json.loads(response_text)
            selected_road = llm_decision["selected_road"]
            descrizione = llm_decision["event_description"]
        except Exception as e:
            print(f"⚠️ Chiamata API o parsing fallito ({e}). Applico fallback deterministico.")
            selected_road = rng.choice(sample_roads)
            descrizione = "Incidente generico rilevato dal sistema di monitoraggio urbano."

    print(f"\n🚨 DETTAGLI EVENTO APPLICATO:")
    print(f"  ➔ Strada Bloccata: {selected_road}")
    print(f"  ➔ Scenario:        {descrizione}\n")

    # 4. Modifica del file PDDL (In-Memory)

    # Rinominiamo il problema
    modified_content = content.replace(
        "(problem bologna_car1_custom)",
        "(problem bologna_car1_custom_dynamic)"
    )

    # Commentiamo la linea road-open della strada selezionata
    linea_da_commentare = f"(road-open {selected_road})"
    linea_commentata = f";; [DYNAMIC EVENT] {descrizione}\n  ;; {linea_da_commentare}"

    if linea_da_commentare in modified_content:
        modified_content = modified_content.replace(linea_da_commentare, linea_commentata)
        print(f"🔒 Stato PDDL aggiornato: '{linea_da_commentare}' rimpiazzata con un blocco.")
    else:
        print(f"⚠️ Riga '{linea_da_commentare}' non trovata nel testo, procedo con la scrittura.")

    # 5. Salvataggio del nuovo file PDDL dinamico
    with open(dynamic_problem_path, "w", encoding="utf-8") as f:
        f.write(modified_content)

    print(f"✅ File generato con successo in: {dynamic_problem_path}")
    print("=" * 70 + "\n")

if __name__ == "__main__":
    main()
