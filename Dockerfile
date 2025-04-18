FROM docker.io/library/alpine:3.21.0

LABEL maintainer="Aaron Silber <aaron@bytes.co>"

RUN set -eux && \
  apk add --update libintl && \
  apk add --virtual build_deps gettext && \
  cp /usr/bin/envsubst /usr/local/bin/envsubst && \
  apk del build_deps

COPY entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]
