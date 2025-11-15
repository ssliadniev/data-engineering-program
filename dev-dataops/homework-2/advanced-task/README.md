# 💬 My Local Chatbot (Streamlit + OpenAI-compatible)

A tiny, batteries-included chat UI built with **Streamlit** that talks to any **OpenAI-compatible** LLM server (local or remote). Point it at your server, pick a model, and chat — with live token streaming and a one-click “Clear history” button.

---

## ✨ Features

- **OpenAI-compatible** client with configurable `base_url` and `model`
- **Live streaming** of assistant tokens for a snappy UX
- **Session history** stored in Streamlit `session_state`
- **One-click reset** (sidebar “Clear Chat History”)
- **Zero real API key required** for local/self-hosted servers (dummy value used)

---

## 🧱 Architecture (at a glance)

- Reads connection details from environment:
  - `LLM_URL` → your server’s OpenAI-compatible base URL
  - `LLM_MODEL` → model name your server exposes
- On missing env vars, the app shows an error and exits early (guard-rail).
- Uses the official `openai` Python SDK with a custom `base_url` and a placeholder key.
- Streams chat completions and renders tokens as they arrive.

> These behaviors are implemented directly in the Streamlit app and Poetry config in this repo. See code for reading `LLM_URL` / `LLM_MODEL`, the early stop on missing envs, the OpenAI client with `base_url`, and streaming via `chat.completions.create(..., stream=True)`; dependencies are declared with Poetry.  

---

## 📦 Requirements

- **Python**: 3.12
- **Poetry**

---

## 🚀 Quick Start

### 1) Clone & run command

```
make build_and_run
