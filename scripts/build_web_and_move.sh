#!/bin/bash
set -e

###
# CONFIG
###

# Flutter project directory (relative to script location)
PROJECT_DIR="packages/locmate_web"

# NEW: The path where Flutter's 'flutter build web' places the output.
# This is relative to the script's original execution location.
PROJECT_BUILD_OUTPUT="$PROJECT_DIR/build/web"

# Clone directory that must always match the original
CLONE_DIR="packages/locmate/web_output"

###
# STEP 1 — NAVIGATE TO PROJECT AND BUILD
###

if [ ! -d "$PROJECT_DIR" ]; then
    echo "❌ Error: Project directory '$PROJECT_DIR' does not exist!"
    exit 1
fi

# IMPORTANT: Changing directory to run the build command
cd "$PROJECT_DIR"

echo "🚀 Building Flutter web app in '$PROJECT_DIR'..."
# The output will be created inside: $PROJECT_DIR/build/web
flutter build web --wasm

# Changing back to the script's root directory for subsequent steps
cd -


###
# STEP 2 — VERIFY BUILD
###

# CHECK: We must check for the build output path, not the original source path.
if [ ! -d "$PROJECT_BUILD_OUTPUT" ]; then
    echo "❌ Build failed! Expected directory '$PROJECT_BUILD_OUTPUT' not found."
    exit 1
fi

echo "✅ Build successful!"


###
# STEP 3— MOVE BUILD OUTPUT TO CLONE DIRECTORY
###

# NOTE: The original script was moving the source 'web' folder.
# We are now moving the build output 'build/web' folder.

if [ -d "$CLONE_DIR" ]; then
    echo "🗑 Removing existing '$CLONE_DIR' directory..."
    # We remove the *clone* directory because we're going to replace it.
    rm -rf "$CLONE_DIR"
fi

# The 'mv' command will rename "$PROJECT_BUILD_OUTPUT" to "$CLONE_DIR"
# The path must be relative to the script execution root.
echo "📦 Moving '$PROJECT_BUILD_OUTPUT' → '$CLONE_DIR'..."
mv "$PROJECT_BUILD_OUTPUT" "$CLONE_DIR"

echo "🎉 Web app successfully built and moved to '$CLONE_DIR'!"


echo "🚀 All done!"