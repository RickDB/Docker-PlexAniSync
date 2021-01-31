# Docker-PlexAniSync

A docker version of [PlexAniSync](https://github.com/RickDB/PlexAniSync) based on [Thundernerd's docker](https://github.com/Thundernerd/Docker-PlexAniSync)

<div>
  
  [![Build Status](https://img.shields.io/docker/cloud/build/rickdb/plexanisync.svg)](https://hub.docker.com/r/rickdb/plexanisync)
  
</div>

## Usage

### docker

```
docker run -d \
  --name=plexanisync \
  --restart unless-stopped \
  -e PLEX_SECTION=Anime \
  -e PLEX_URL=http://127.0.0.1:32400 \
  -e PLEX_TOKEN=SomePlexToken \
  -e ANI_USERNAME=SomeUser \
  -e ANI_TOKEN=SomeToken \
  -e INTERVAL=3600 \
  -v /etc/localtime:/etc/localtime:ro \
  rickdb/plexanisync:latest
```

### Environment Variables

| ID                          | Default                  | Required | Note                                                                                                                                                                         |
| --------------------------- | ------------------------ | -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| PLEX_SECTION                | Anime                    | [x]      | The library where your anime resides                                                                                                                                         |
| PLEX_URL                    | http://127.0.0.1:32400   | [x]      | The address to your Plex Media Server, for example: http://127.0.0.1:32400                                                                                                   |
| PLEX_TOKEN                  | -                        | [x]      | Follow [this guide](https://support.plex.tv/articles/204059436-finding-an-authentication-token-x-plex-token/)                                                                |
| ANI_USERNAME                | -                        | [x]      | Your [AniList.co](http://www.anilist.co) username                                                                                                                            |
| ANI_TOKEN                   | -                        | [x]      | Get it [here](https://anilist.co/api/v2/oauth/authorize?client_id=1549&response_type=token)                                                                                  |
| INTERVAL                    | 3600                     | [x]      | The time in between syncs                                                                                                                                                    |
| PLEX_EPISODE_COUNT_PRIORITY | -                        | [ ]      | Plex episode watched count will take priority over AniList (default = False)                                                                                                 |
| SKIP_LIST_UPDATE            | -                        | [ ]      | If set to True it will NOT update your AniList which is useful if you want to do a test run to check if everything lines up properly. (default = False)

### Custom mappings

In order to provide a [custom_mappings.yaml file](https://github.com/RickDB/PlexAniSync#custom-anime-mapping), mount the file on your host to `/plexanisync/custom_mappings.yaml` like this:

```
-v /path/to/your/custom_mappings.yaml:/plexanisync/custom_mappings.yaml
```

You can modify the file on the host system anytime and it will be used during the next run. Restarting the container is not necessary.