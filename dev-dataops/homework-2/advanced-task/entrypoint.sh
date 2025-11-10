#!/bin/sh

exec streamlit run app.py --server.port="${STREAMLIT_PORT}" --server.address="${SERVER}" "$@"
