FROM python:3.9-alpine

RUN apk add --no-cache --update \
    ca-certificates \
    tzdata \
    && update-ca-certificates \
    && rm -rf /root/.cache

ENV PLEX_SECTION=Anime \
    PLEX_URL=http://127.0.0.1:32400 \
    PLEX_TOKEN='' \
    ANI_USERNAME='' \
    ANI_TOKEN='' \
    INTERVAL=3600

ENV PATH="${PATH}:~/.local/bin"

RUN apk add --no-cache --update --virtual build-dependencies wget unzip && \
    wget -q https://github.com/RickDB/PlexAniSync/archive/master.zip && \
    unzip master.zip && \
    rm master.zip && \
    mv /PlexAniSync-master /plexanisync && \
    cd /plexanisync && \
    python3 -m pip install -r requirements.txt && \
    cd .. && \
    apk del build-dependencies

ADD run/* /plexanisync/
RUN chmod +x /plexanisync/*.sh
CMD ["/plexanisync/runsync.sh"]