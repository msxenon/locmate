#!/usr/bin/env bash
set -e

# 1. Install host_bridge globally if not present
if ! dart pub global list 2>/dev/null | grep -q 'host_bridge'; then
  echo "Installing host_bridge..."
  dart pub global activate host_bridge
fi

# 2. Start host_bridge in background and capture listening address
HOST_BRIDGE_LOG=$(mktemp)
trap 'rm -f "$HOST_BRIDGE_LOG"' EXIT

host_bridge 2>&1 | tee "$HOST_BRIDGE_LOG" &
HOST_BRIDGE_PID=$!
trap 'kill $HOST_BRIDGE_PID 2>/dev/null; rm -f "$HOST_BRIDGE_LOG"' EXIT

# Wait for server to print listening URL
for _ in $(seq 1 10); do
  sleep 1
  if grep -q "Listening on" "$HOST_BRIDGE_LOG" 2>/dev/null; then
    break
  fi
done

HOST_BRIDGE_URL=$(grep -o 'http://[^[:space:]]*' "$HOST_BRIDGE_LOG" | head -1)
if [ -z "$HOST_BRIDGE_URL" ]; then
  echo "Failed to get host_bridge listening address"
  kill $HOST_BRIDGE_PID 2>/dev/null || true
  exit 1
fi

export HOST_BRIDGE_URL
echo "host_bridge listening at: $HOST_BRIDGE_URL"
set -x
# 3. Run patrol tests with HOST_BRIDGE_URL
cd "$(dirname "$0")/.." && patrol test -d chrome --verbose --show-flutter-logs --dart-define=HOST_BRIDGE_URL="$HOST_BRIDGE_URL"

# Keep script alive so host_bridge keeps running; Ctrl+C will kill both
wait $HOST_BRIDGE_PID
