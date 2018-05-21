# A CKAN testing image with an APIfied paster
# FROM debian:jessie

FROM ckan/ckan:latest

COPY paster_api.py /paster_api.py
COPY serve.sh /usr/local/bin/serve.sh

EXPOSE 8000

CMD ["serve.sh"]
