import os

import streamlit as st
from openai import OpenAI

st.title("💬 My Local Chatbot")

llm_api_base = os.getenv("LLM_URL")
llm_model_name = os.getenv("LLM_MODEL")

if not llm_api_base or not llm_model_name:
    st.error(
        "Error: LLM_URL and/or LLM_MODEL environment variables are not set. "
        "Please set them and restart the app."
    )
    st.stop()

st.caption(f"Powered by 🐳 Docker Model Runner ({llm_model_name})")

client = OpenAI(
    base_url=llm_api_base,
    api_key="key-not-needed"
)

if "messages" not in st.session_state:
    st.session_state.messages = [
        {"role": "assistant", "content": "How can I help you today?"}
    ]

with st.sidebar:
    if st.button("Clear Chat History"):
        st.session_state.messages = [
            {"role": "assistant", "content": "How can I help you today?"}
        ]
        st.rerun()

for message in st.session_state.messages:
    with st.chat_message(message["role"]):
        st.markdown(message["content"])


if prompt := st.chat_input("What is up?"):
    st.session_state.messages.append({"role": "user", "content": prompt})
    with st.chat_message("user"):
        st.markdown(prompt)

    with st.chat_message("assistant"):
        message_placeholder = st.empty()
        full_response = ""

        try:
            stream = client.chat.completions.create(
                model=llm_model_name,
                messages=[
                    {"role": m["role"], "content": m["content"]}
                    for m in st.session_state.messages
                ],
                stream=True,
            )

            for chunk in stream:
                if chunk.choices[0].delta.content is not None:
                    full_response += chunk.choices[0].delta.content
                    message_placeholder.markdown(full_response + "▌")

            message_placeholder.markdown(full_response)

            st.session_state.messages.append({"role": "assistant", "content": full_response})

        except Exception as error:
            st.error(f"Error communicating with LLM: {error}")
            st.session_state.messages.pop()
