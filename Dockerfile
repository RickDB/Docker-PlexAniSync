FROM python:latest

ENV PLEX_SECTION=Anime \
    PLEX_URL=localhost \
    PLEX_TOKEN='' \
    ANI_USERNAME='' \
    ANI_TOKEN='' \
    INTERVAL=3600

ENV PATH="${PATH}:~/.local/bin"

RUN apt-get update &&\
    apt-get install -y wget unzip &&\
    wget https://github.com/RickDB/PlexAniSync/archive/master.zip &&\
    unzip master.zip &&\
    rm master.zip &&\
    mv /PlexAniSync-master /plexanisync &&\
    cd /plexanisync &&\
    python3 -m pip install -r requirements.txt &&\
    cd ..

COPY runsync.sh settingsupdater.py ./

RUN chmod +x /runsync.sh

CMD ["/runsync.sh"]
