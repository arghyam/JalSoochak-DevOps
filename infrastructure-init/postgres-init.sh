#!/bin/bash
set -e

echo "Running custom initialization script..."

for f in /mnt/database/*.sql; do
    if [ ! -f "$f" ]; then
        echo "No .sql files found in /mnt/database/."
        break
    fi
    filename=$(basename "$f")
    echo "Running $filename..."
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -f "$f"
done

echo "Initialization complete."
