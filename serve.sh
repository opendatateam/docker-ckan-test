#!/bin/sh
CKAN_INI=$CKAN_CONFIG/production.ini $CKAN_VENV/bin/python /paster_api.py &
ckan-paster serve $CKAN_CONFIG/production.ini
