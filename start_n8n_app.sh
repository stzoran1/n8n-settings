#!/bin/bash

export NVM_DIR="/home/forge/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Use the desired version of Node
nvm use 24.4.1

# Add Node binary path to PATH
export PATH="$NVM_DIR/versions/node/v24.4.1/bin:$PATH"

# Environment variables for n8n
export WEBHOOK_URL="https://n8n.yourdomain.com"
export N8N_SECURE_COOKIE=false
export N8N_PUSH_BACKEND=sse
export N8N_EDITOR_BASE_URL="https://n8n.yourdomain.com"

# Run your Node.js application
n8n start
