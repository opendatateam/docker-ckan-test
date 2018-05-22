# A CKAN testing image with an APIfied paster
# FROM debian:jessie

FROM ckan/ckan:latest

COPY paster_api.py /paster_api.py
COPY serve.sh /usr/local/bin/
COPY production.ini $CKAN_CONFIG/

EXPOSE 8000

CMD ["serve.sh"]
