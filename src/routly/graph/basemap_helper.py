from __future__ import annotations

import math
from typing import Any
import matplotlib.pyplot as plt


def _estimate_utm_epsg_from_nodes(nodes: list[dict[str, Any]]) -> str | None:
    """Estimate the UTM EPSG code from the mean node coordinates."""
    lats, lons = [], []
    for n in nodes:
        if "lat" in n and "lon" in n:
            lats.append(float(n["lat"]))
            lons.append(float(n["lon"]))
            
    if not lats or not lons:
        return None
        
    mean_lat = sum(lats) / len(lats)
    mean_lon = sum(lons) / len(lons)
    
    # Convert longitude to its standard six-degree UTM zone.
    utm_zone = int((mean_lon + 180) / 6) + 1
    if mean_lat >= 0:
        return f"EPSG:{32600 + utm_zone}"
    return f"EPSG:{32700 + utm_zone}"


def add_realworld_basemap(
    ax: plt.Axes, 
    mapping: dict[str, Any], 
    map_style: str = "osm",
    alpha: float = 0.65
) -> None:
    """Add an OpenStreetMap or satellite basemap to a Matplotlib axis.

    Args:
        ax: Axis that receives the basemap.
        mapping: Road-network mapping with node coordinates and an optional CRS.
        map_style: ``osm`` or ``satellite``.
        alpha: Basemap opacity in the inclusive range 0.0 to 1.0.
    """
    try:
        import contextily as ctx
    except ImportError:
        print(
            "WARNING: contextily is not installed; basemap rendering is disabled."
        )
        return

    nodes = mapping.get("nodes", [])
    if not nodes:
        return

    # Prefer the mapping CRS and estimate it only when metadata is absent.
    crs = mapping.get("crs")
    if not crs:
        crs = _estimate_utm_epsg_from_nodes(nodes)
        
    if not crs:
        crs = "EPSG:3857"

    if map_style.lower() == "satellite":
        source = ctx.providers.Esri.WorldImagery
    else:
        source = ctx.providers.OpenStreetMap.Mapnik

    try:
        print(f"Loading {map_style.upper()} basemap tiles with CRS {crs}...")
        ctx.add_basemap(
            ax,
            crs=crs,
            source=source,
            alpha=alpha,
            zorder=0,
        )
        print("Basemap loaded successfully.")
    except Exception as e:
        print(
            "WARNING: basemap tiles could not be loaded; using the plain "
            f"background instead ({e})."
        )
