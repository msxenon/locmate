#!/usr/bin/env bash
set -e

# Disable job control so killing the background host_bridge doesn't print "Terminated: 15"
set +m

# Parse -t <file> to run a single test file (passed as --target to patrol)
PATROL_TEST_FILE=
while [ $# -gt 0 ]; do
  case "$1" in
    -t)
      shift
      [ $# -gt 0 ] && PATROL_TEST_FILE="$1" && shift
      ;;
    *)
      shift
      ;;
  esac
done

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
# Use -t <path> to run a single file, e.g. -t patrol_test/server_not_connected_test.dart
# Patrol expects --target for a single file (not a positional path).
if [ -n "$PATROL_TEST_FILE" ]; then
  cd "$(dirname "$0")/.." && script -q patrol_test_output.log patrol test \
    -d chrome \
    --verbose \
    --show-flutter-logs \
    --no-hide-test-steps \
    --no-clear-test-steps \
    --target "$PATROL_TEST_FILE" \
    --dart-define=HOST_BRIDGE_URL="$HOST_BRIDGE_URL" \
    --dart-define=LOCMATE_PACKAGE_PATH="$LOCMATE_PACKAGE_PATH"
else
  cd "$(dirname "$0")/.." && script -q patrol_test_output.log patrol test \
    -d chrome \
    --verbose \
    --show-flutter-logs \
    --no-hide-test-steps \
    --no-clear-test-steps \
    --dart-define=HOST_BRIDGE_URL="$HOST_BRIDGE_URL" \
    --dart-define=LOCMATE_PACKAGE_PATH="$LOCMATE_PACKAGE_PATH"
fi

# Script exits here; EXIT trap kills host_bridge
