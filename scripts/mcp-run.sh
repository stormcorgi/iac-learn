#!/usr/bin/env bash
# Minimal script to run Context7 MCP server locally using Podman
#
# Prerequisites:
#   * Podman installed (apt install podman or brew install podman)
#   * A Context7 API key set in the environment as CONTEXT7_API_KEY
#
# Usage:
#   export CONTEXT7_API_KEY=sk_XXXX
#   bash scripts/mcp-run.sh
#
# The container will be named "context7-mcp" and exposed on port 8080.
set -euo pipefail

# Pull latest image (uses upstash/context7-mcp)
podman pull upstash/context7-mcp:latest

# Remove any existing container with the same name
if podman ps -a --format '{{.Names}}' | grep -q '^context7-mcp$'; then
  podman rm -f context7-mcp
fi

# Run container detached
podman run -d \
  --name context7-mcp \
  -p 8080:8080 \
  -e CONTEXT7_API_KEY="$CONTEXT7_API_KEY" \
  --restart unless-stopped \
  upstash/context7-mcp:latest

echo "✅ Context7 MCP server started on http://localhost:8080"
