from __future__ import annotations

from pathlib import Path
from typing import Any

from PIL import Image, ImageDraw, ImageFont


def plot_mapping_graph(
    mapping: dict[str, Any],
    output_path: str | Path,
    *,
    title: str,
    start_loc: str | None = None,
    goal_loc: str | None = None,
    size: tuple[int, int] = (2200, 2200),
    render_scale: int = 3,
) -> None:
    """Render a lightweight structural graph view directly from a mapping."""
    output_path = Path(output_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    nodes_by_id = {node["id"]: node for node in mapping.get("nodes", [])}
    roads = list(mapping.get("roads", []))
    bounds = _mapping_bounds(mapping)
    scale = max(1, int(render_scale))
    canvas_size = (size[0] * scale, size[1] * scale)
    canvas_margin = 110 * scale

    image = Image.new("RGB", canvas_size, "white")
    draw = ImageDraw.Draw(image)

    for road in roads:
        points = _road_points(road, nodes_by_id)
        if len(points) < 2:
            continue
        pixels = [
            _to_pixel(point[0], point[1], bounds, canvas_size, canvas_margin)
            for point in points
        ]
        draw.line(
            pixels,
            fill=(114, 124, 133),
            width=max(3, 2 * scale),
            joint="curve",
        )

    node_radius = max(3, min(6, int(size[0] / 450))) * scale
    for node in mapping.get("nodes", []):
        x, y = _to_pixel(
            float(node["x"]),
            float(node["y"]),
            bounds,
            canvas_size,
            canvas_margin,
        )
        draw.ellipse(
            (x - node_radius, y - node_radius, x + node_radius, y + node_radius),
            fill=(30, 97, 165),
        )

    _draw_special_node(
        draw,
        nodes_by_id,
        bounds,
        canvas_size,
        canvas_margin,
        start_loc,
        (38, 132, 57),
        scale,
    )
    _draw_special_node(
        draw,
        nodes_by_id,
        bounds,
        canvas_size,
        canvas_margin,
        goal_loc,
        (198, 40, 40),
        scale,
    )

    if scale > 1:
        image = image.resize(size, Image.Resampling.LANCZOS)
        draw = ImageDraw.Draw(image)

    subtitle = f"{len(roads)} roads, {len(mapping.get('nodes', []))} nodes"
    title_font = _font(24)
    subtitle_font = _font(18)
    draw.text((24, 18), title, fill=(20, 20, 20), font=title_font)
    draw.text((24, 48), subtitle, fill=(70, 70, 70), font=subtitle_font)
    _draw_special_label(draw, nodes_by_id, bounds, size, start_loc, (38, 132, 57), "S")
    _draw_special_label(draw, nodes_by_id, bounds, size, goal_loc, (198, 40, 40), "G")
    image.save(output_path)


def _mapping_bounds(mapping: dict[str, Any]) -> tuple[float, float, float, float]:
    xs: list[float] = []
    ys: list[float] = []
    for node in mapping.get("nodes", []):
        xs.append(float(node["x"]))
        ys.append(float(node["y"]))
    for road in mapping.get("roads", []):
        for x, y in road.get("geometry") or []:
            xs.append(float(x))
            ys.append(float(y))

    if not xs or not ys:
        return (0.0, 1.0, 0.0, 1.0)

    min_x, max_x = min(xs), max(xs)
    min_y, max_y = min(ys), max(ys)
    if min_x == max_x:
        max_x += 1.0
    if min_y == max_y:
        max_y += 1.0
    return min_x, max_x, min_y, max_y


def _road_points(
    road: dict[str, Any],
    nodes_by_id: dict[str, dict[str, Any]],
) -> list[tuple[float, float]]:
    geometry = road.get("geometry") or []
    if len(geometry) >= 2:
        return [(float(x), float(y)) for x, y in geometry]

    points = []
    for loc_key in ("from", "to"):
        node = nodes_by_id.get(road.get(loc_key))
        if node is not None:
            points.append((float(node["x"]), float(node["y"])))
    return points


def _to_pixel(
    x: float,
    y: float,
    bounds: tuple[float, float, float, float],
    size: tuple[int, int],
    margin: int,
) -> tuple[int, int]:
    min_x, max_x, min_y, max_y = bounds
    width, height = size
    usable_w = max(1, width - 2 * margin)
    usable_h = max(1, height - 2 * margin)
    px = margin + ((x - min_x) / (max_x - min_x)) * usable_w
    py = height - margin - ((y - min_y) / (max_y - min_y)) * usable_h
    return int(round(px)), int(round(py))


def _draw_special_node(
    draw: ImageDraw.ImageDraw,
    nodes_by_id: dict[str, dict[str, Any]],
    bounds: tuple[float, float, float, float],
    size: tuple[int, int],
    margin: int,
    node_id: str | None,
    color: tuple[int, int, int],
    scale: int,
) -> None:
    if not node_id:
        return
    node = nodes_by_id.get(node_id)
    if node is None:
        return
    x, y = _to_pixel(float(node["x"]), float(node["y"]), bounds, size, margin)
    radius = 15 * scale
    draw.ellipse(
        (x - radius, y - radius, x + radius, y + radius),
        fill=color,
        outline=(255, 255, 255),
        width=3 * scale,
    )


def _draw_special_label(
    draw: ImageDraw.ImageDraw,
    nodes_by_id: dict[str, dict[str, Any]],
    bounds: tuple[float, float, float, float],
    size: tuple[int, int],
    node_id: str | None,
    color: tuple[int, int, int],
    label: str,
) -> None:
    if not node_id:
        return
    node = nodes_by_id.get(node_id)
    if node is None:
        return
    x, y = _to_pixel(float(node["x"]), float(node["y"]), bounds, size, 110)
    draw.text((x + 18, y - 12), label, fill=color, font=_font(18))


def _font(size: int) -> ImageFont.ImageFont:
    try:
        return ImageFont.truetype("arial.ttf", size)
    except OSError:
        return ImageFont.load_default()
