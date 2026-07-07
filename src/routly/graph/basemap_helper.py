from __future__ import annotations

import math
from typing import Any
import matplotlib.pyplot as plt


def _estimate_utm_epsg_from_nodes(nodes: list[dict[str, Any]]) -> str | None:
    """Calcola automaticamente il codice EPSG UTM corretto partendo da latitudine 
    e longitudine dei nodi, indispensabile per allineare le mappe reali ai metri di OSMnx."""
    lats, lons = [], []
    for n in nodes:
        if "lat" in n and "lon" in n:
            lats.append(float(n["lat"]))
            lons.append(float(n["lon"]))
            
    if not lats or not lons:
        return None
        
    mean_lat = sum(lats) / len(lats)
    mean_lon = sum(lons) / len(lons)
    
    # Formula standard per calcolare la zona UTM da longitudine e latitudine
    utm_zone = int((mean_lon + 180) / 6) + 1
    if mean_lat >= 0:
        return f"EPSG:{32600 + utm_zone}"  # Emisfero Nord (es. EPSG:32632 o 32633 per l'Italia)
    else:
        return f"EPSG:{32700 + utm_zone}"  # Emisfero Sud


def add_realworld_basemap(
    ax: plt.Axes, 
    mapping: dict[str, Any], 
    map_style: str = "osm",
    alpha: float = 0.65
) -> None:
    """Scarica e inietta una mappa reale (OpenStreetMap o Satellite) come sfondo del grafico Matplotlib.
    
    Argomenti:
        ax: L'asse Matplotlib su cui disegnare.
        mapping: Il dizionario di mappatura contenente i nodi della rete.
        map_style: 'osm' per la cartografia OpenStreetMap classica, 'satellite' per la vista satellitare reale.
        alpha: Trasparenza dello sfondo cartografico (0.0 - 1.0).
    """
    try:
        import contextily as ctx
    except ImportError:
        print("⚠️ Libreria 'contextily' non trovata. Esegui 'pip install contextily' per attivare le mappe di sfondo.")
        return

    nodes = mapping.get("nodes", [])
    if not nodes:
        return

    # Determina il CRS (Coordinate Reference System) corretto
    crs = mapping.get("crs")
    if not crs:
        crs = _estimate_utm_epsg_from_nodes(nodes)
        
    # Se i nodi non hanno lat/lon, usiamo un fallback sul Web Mercator standard o UTM 32N
    if not crs:
        crs = "EPSG:3857"

    # Selezione del provider grafico
    if map_style.lower() == "satellite":
        source = ctx.providers.Esri.WorldImagery
    else:
        source = ctx.providers.OpenStreetMap.Mapnik

    try:
        print(f"🗺️ Download tile cartografiche in corso ({map_style.upper()}) con proiezione {crs}...")
        ctx.add_basemap(
            ax,
            crs=crs,
            source=source,
            alpha=alpha,
            zorder=0  # Forza il disegno al di sotto di tutte le strade e i marker
        )
        print("✅ Mappa reale integrata con successo sullo sfondo.")
    except Exception as e:
        print(f"⚠️ Impossibile caricare lo sfondo cartografico da internet ({e}). Mantenimento sfondo bianco standard.")