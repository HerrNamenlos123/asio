#!/bin/bash
set -e		# exit on error
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo "Cleaning project..."

echo "Cleaning bin directory..."
rm -rf "$SCRIPT_DIR/bin"
echo "Cleaning build directory..."
rm -rf "$SCRIPT_DIR/build"

echo "Done"
