from __future__ import annotations

import json
import os
import urllib.error
import urllib.request

from dotenv import load_dotenv

load_dotenv()

GROQ_MODEL ="meta-llama/llama-4-scout-17b-16e-instruct"#"openai/gpt-oss-120b"


def call_llm(
    prompt: str,
    backend: str = "ollama",
    timeout: int = 180,
    seed: int | None = None,
) -> str:
    """Call an LLM backend and return the raw text content of its reply.

    `backend` selects both the request shape and the response parsing:
      - "lmstudio": OpenAI-compatible /v1/chat/completions (qwen/qwen2.5-coder-14b)
      - "ollama"  : /api/chat (gpt-oss:120b-cloud)
      - "groq"    : OpenAI-compatible Groq cloud API, requires GROQ_API_KEY in the
                    environment (loaded from a .env file at the project root)
    """
    headers = {
        "Content-Type": "application/json",
        "User-Agent": "Mozilla/5.0 (compatible; routly-planner/1.0)",
    }

    if backend == "lmstudio":
        url = "http://127.0.0.1:1234/v1/chat/completions"
        data = {
            "model": "local-model",
            "messages": [{"role": "user", "content": prompt}],
            "temperature": 0.6,
        }
        if seed is not None:
            data["seed"] = seed
    elif backend == "groq":
        api_key = os.environ.get("GROQ_API_KEY")
        if not api_key:
            raise RuntimeError(
                "GROQ_API_KEY is not set. Add it to a .env file at the project root."
            )
        url = "https://api.groq.com/openai/v1/chat/completions"
        headers["Authorization"] = f"Bearer {api_key}"
        data = {
            "model": GROQ_MODEL,
            "messages": [{"role": "user", "content": prompt}],
            "temperature": 0.6,
        }
        if seed is not None:
            data["seed"] = seed
    else:
        url = "http://localhost:11434/api/chat"
        data = {
            "model": "gpt-oss:120b-cloud",
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
        raise RuntimeError(f"{backend} API request failed: HTTP {e.code} {e.reason} - {body}") from e

    print(f"[llm_client debug] {backend} raw response: {raw_body}")

    if backend in ("lmstudio", "groq"):
        return res["choices"][0]["message"]["content"]
    return res["message"]["content"]
