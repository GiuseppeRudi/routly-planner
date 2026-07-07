from __future__ import annotations

import json
import os
from pathlib import Path
import urllib.error
import urllib.request

from dotenv import load_dotenv

PROJECT_ROOT = Path(__file__).resolve().parents[2]
load_dotenv(PROJECT_ROOT / ".env")

SUPPORTED_LLM_PROVIDERS = {"ollama", "lmstudio", "groq"}


def _required_env(name: str) -> str:
    value = os.environ.get(name, "").strip()
    if not value:
        raise RuntimeError(
            f"{name} is not set. Add it to a .env file at the project root "
            "or export it in the shell."
        )
    return value


def _llm_provider() -> str:
    provider = _required_env("ROUTLY_LLM_PROVIDER").lower()
    if provider not in SUPPORTED_LLM_PROVIDERS:
        valid = ", ".join(sorted(SUPPORTED_LLM_PROVIDERS))
        raise RuntimeError(
            f"Unsupported ROUTLY_LLM_PROVIDER={provider!r}. "
            f"Valid values are: {valid}."
        )
    return provider


def call_llm(
    prompt: str,
    timeout: int = 180,
    seed: int | None = None,
) -> str:
    """Call an LLM backend and return the raw text content of its reply.

    ROUTLY_LLM_PROVIDER selects both the request shape and response parsing:
      - "lmstudio": OpenAI-compatible /v1/chat/completions
      - "ollama"  : /api/chat
      - "groq"    : OpenAI-compatible Groq cloud API, requires GROQ_API_KEY in the
                    environment (loaded from a .env file at the project root)

    ROUTLY_LLM_MODEL selects the model for the active provider.
    """
    provider = _llm_provider()
    model = _required_env("ROUTLY_LLM_MODEL")
    headers = {
        "Content-Type": "application/json",
        "User-Agent": "Mozilla/5.0 (compatible; routly-planner/1.0)",
    }

    if provider == "lmstudio":
        url = "http://127.0.0.1:1234/v1/chat/completions"
        data = {
            "model": model,
            "messages": [{"role": "user", "content": prompt}],
            "temperature": 0.6,
        }
        if seed is not None:
            data["seed"] = seed
    elif provider == "groq":
        api_key = _required_env("GROQ_API_KEY")
        url = "https://api.groq.com/openai/v1/chat/completions"
        headers["Authorization"] = f"Bearer {api_key}"
        data = {
            "model": model,
            "messages": [{"role": "user", "content": prompt}],
            "temperature": 0.6,
        }
        if seed is not None:
            data["seed"] = seed
    else:
        url = "http://localhost:11434/api/chat"
        data = {
            "model": model,
            "messages": [{"role": "user", "content": prompt}],
            "options": {"temperature": 0.6},
            "stream": False,
        }
        if seed is not None:
            data["options"]["seed"] = seed

    req = urllib.request.Request(
        url,
        data=json.dumps(data).encode("utf-8"),
        headers=headers,
    )
    try:
        with urllib.request.urlopen(req, timeout=timeout) as response:
            raw_body = response.read().decode("utf-8")
            res = json.loads(raw_body)
    except urllib.error.HTTPError as e:
        body = e.read().decode("utf-8", errors="replace")
        raise RuntimeError(
            f"{provider} API request failed: HTTP {e.code} {e.reason} - {body}"
        ) from e

    print(f"[llm_client debug] {provider} raw response: {raw_body}")

    if provider in ("lmstudio", "groq"):
        return res["choices"][0]["message"]["content"]
    return res["message"]["content"]
