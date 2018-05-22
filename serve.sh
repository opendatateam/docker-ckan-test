#!/bin/sh
# Wait for DB
set -e
if [ -n "$CKAN_WAIT_FOR" ]; then
    echo "Waiting for database"
    dockerize -wait $CKAN_WAIT_FOR -timeout 120s
fi
CKAN_INI=$CKAN_CONFIG/production.ini $CKAN_VENV/bin/python /paster_api.py &
ckan-paster serve $CKAN_CONFIG/production.ini
