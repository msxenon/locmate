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

# Redirect host_bridge output to log file only - its verbose Alfred debug logs
# would otherwise mix with patrol output and make it unreadable
host_bridge > "$HOST_BRIDGE_LOG" 2>&1 &
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

# 3. Resolve locmate package path for host_bridge (tests start locmate via host_bridge)
LOCMATE_PACKAGE_PATH="$(cd "$(dirname "$0")/../../locmate" && pwd)"
echo "locmate package at: $LOCMATE_PACKAGE_PATH"

# 4. Run patrol tests with HOST_BRIDGE_URL and LOCMATE_PACKAGE_PATH
# Use script to run in a pseudo-TTY so patrol outputs rich colors (piping to tee disables colors)
# Flags:
#   --verbose: Show detailed output
#   --show-flutter-logs: Show Flutter framework logs
#   --no-hide-test-steps: Show all test steps
#   --no-clear-test-steps: Keep test steps visible after completion
cd "$(dirname "$0")/.." && script -q patrol_test_output.log patrol test \
  -d chrome \
  --verbose \
  --show-flutter-logs \
  --no-hide-test-steps \
  --no-clear-test-steps \
  --dart-define=HOST_BRIDGE_URL="$HOST_BRIDGE_URL" \
  --dart-define=LOCMATE_PACKAGE_PATH="$LOCMATE_PACKAGE_PATH"

# Script exits here; EXIT trap kills host_bridge
