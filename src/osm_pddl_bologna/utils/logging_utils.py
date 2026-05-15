from rich.console import Console

console = Console()


def info(message: str) -> None:
    console.print(f"[bold blue]INFO[/bold blue] {message}")


def success(message: str) -> None:
    console.print(f"[bold green]OK[/bold green] {message}")


def warning(message: str) -> None:
    console.print(f"[bold yellow]WARNING[/bold yellow] {message}")
