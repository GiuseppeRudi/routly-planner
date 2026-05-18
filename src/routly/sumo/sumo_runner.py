from __future__ import annotations

from pathlib import Path


def launch_sumo_gui(cfg_file: str | Path, sumo_gui: str = "sumo-gui", vehicle_id: str = "car1") -> None:
    """
    Launch SUMO-GUI and track the vehicle with TraCI.

    Importing traci happens inside the function so the rest of the project can be used
    even when SUMO/TraCI is not installed.
    """
    import traci

    cfg_file = Path(cfg_file)

    sumo_cmd = [
        sumo_gui,
        "-c", str(cfg_file),
        "--window-size", "1200,800",
    ]

    print("Launching SUMO-GUI...")
    traci.start(sumo_cmd)

    tracked = False
    try:
        while traci.simulation.getMinExpectedNumber() > 0:
            traci.simulationStep()

            if not tracked and vehicle_id in traci.vehicle.getIDList():
                traci.gui.trackVehicle("View #0", vehicle_id)
                traci.gui.setZoom("View #0", 4000)
                tracked = True
                print(f"Vehicle {vehicle_id} is now tracked.")
    finally:
        traci.close()
