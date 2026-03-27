#!/bin/bash
set -e

echo "Creating Keycloak Database..."
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE bitnami_keycloak;
    GRANT ALL PRIVILEGES ON DATABASE bitnami_keycloak TO $POSTGRES_USER;
EOSQL

echo "Running migrations in numerical order..."

# Use 'ls -v' or 'sort -V' to ensure V2 runs before V10
for f in $(ls -v /mnt/database/V*.sql); do
    echo "Applying migration: $(basename "$f")"
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -f "$f"
done

# Run any remaining non-versioned files like keycloak.sql last
if [ -f "/mnt/database/keycloak.sql" ]; then
    echo "Running keycloak.sql..."
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "bitnami_keycloak" -f "/mnt/database/keycloak.sql"
fi

echo "Initialization complete."