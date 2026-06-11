from __future__ import annotations

import json
import urllib.request


def call_llm(prompt: str, backend: str = "ollama", timeout: int = 180) -> str:
    """Call a local LLM server and return the raw text content of its reply.

    `backend` selects both the request shape and the response parsing:
      - "lmstudio": OpenAI-compatible /v1/chat/completions (qwen/qwen2.5-coder-14b)
      - "ollama"  : /api/chat (gpt-oss:120b-cloud)
    """
    if backend == "lmstudio":
        url = "http://127.0.0.1:1234/v1/chat/completions"
        data = {
            "model": "qwen/qwen2.5-coder-14b",
            "messages": [{"role": "user", "content": prompt}],
            "temperature": 0.8,
        }
    else:
        url = "http://localhost:11434/api/chat"
        data = {
            "model": "gpt-oss:120b-cloud",
            "messages": [{"role": "user", "content": prompt}],
            "options": {"temperature": 0.8},
            "stream": False,
        }

    req = urllib.request.Request(
        url,
        data=json.dumps(data).encode("utf-8"),
        headers={"Content-Type": "application/json"},
    )
    with urllib.request.urlopen(req, timeout=timeout) as response:
        res = json.loads(response.read().decode("utf-8"))

    if backend == "lmstudio":
        return res["choices"][0]["message"]["content"]
    return res["message"]["content"]
