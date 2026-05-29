#!/usr/bin/env python3
"""
Stampa i nomi dei file presenti nella directory `sumo` e li legge ad alta voce.

Utilizzo:
    python scripts/print_sumo_filenames.py [percorso]

Se non viene fornito alcun percorso, verrà usata la directory predefinita:
`src/routly/sumo`.

Nota:
    Questo script utilizza la libreria `pyttsx3` per la sintesi vocale.
    Assicurati di averla installata nel tuo ambiente:

        pip install pyttsx3
"""

import argparse
import sys
from pathlib import Path

# Importiamo pyttsx3 per la sintesi vocale.
# Se la libreria non è disponibile, il programma continuerà a stampare i nomi
# ma non produrrà l'output audio.
try:
    import pyttsx3
except ImportError:  # pragma: no cover
    pyttsx3 = None


def _init_tts_engine():
    """
    Inizializza e restituisce il motore TTS di pyttsx3.
    Se la libreria non è disponibile, ritorna None.
    """
    if pyttsx3 is None:
        return None
    engine = pyttsx3.init()
    # Opzionale: impostazioni vocali (velocità, volume, voce)
    engine.setProperty("rate", 150)   # parole al minuto
    engine.setProperty("volume", 0.9)  # volume da 0.0 a 1.0
    return engine


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Stampa e legge ad alta voce i nomi dei file nella directory sumo."
    )
    parser.add_argument(
        "path",
        nargs="?",
        default="src/routly/sumo",
        help="Percorso della directory sumo (default: src/routly/sumo).",
    )
    args = parser.parse_args()

    sumo_dir = Path(args.path)

    if not sumo_dir.is_dir():
        sys.stderr.write(f"Errore: {sumo_dir} non è una directory valida.\n")
        sys.exit(1)

    # Inizializza il motore TTS (se disponibile)
    tts_engine = _init_tts_engine()

    # Stampa e (se possibile) legge i nomi dei file (esclude le sottodirectory)
    for entry in sorted(sumo_dir.iterdir()):
        if entry.is_file():
            filename = entry.name
            print(filename)
            if tts_engine is not None:
                tts_engine.say(filename)

    # Se abbiamo usato il motore TTS, attendiamo il completamento della pronuncia
    if tts_engine is not None:
        tts_engine.runAndWait()


if __name__ == "__main__":
    main()
