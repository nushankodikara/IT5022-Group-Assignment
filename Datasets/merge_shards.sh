#!/usr/bin/env bash
# Recombines dataset shards into full CSV files
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$SCRIPT_DIR/nyc-taxi-trip-duration"

echo "Merging NYC Taxi Trip Duration dataset shards..."

if [ -d "$TARGET_DIR/shards" ]; then
    cat "$TARGET_DIR/shards/train.csv.part_"* > "$TARGET_DIR/train.csv"
    echo "  [OK] train.csv merged ($(ls -lh "$TARGET_DIR/train.csv" | awk '{print $5}'))"
    
    cat "$TARGET_DIR/shards/test.csv.part_"* > "$TARGET_DIR/test.csv"
    echo "  [OK] test.csv merged ($(ls -lh "$TARGET_DIR/test.csv" | awk '{print $5}'))"
else
    echo "Error: shards directory not found at $TARGET_DIR/shards"
    exit 1
fi

echo "Dataset reassembly complete!"
