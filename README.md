# Docker-PlexAniSync

A docker version of [PlexAniSync](https://github.com/RickDB/PlexAniSync) based on [Thundernerd's docker](https://github.com/Thundernerd/Docker-PlexAniSync)

<div>
  
  [![Build Status](https://img.shields.io/docker/cloud/build/rickdb/plexanisync.svg)](https://hub.docker.com/r/rickdb/plexanisync)
  
</div>

## Usage

### docker

Generic x64 systems (AMD / Intel)
```
docker create \
  --name=plexanisync \
  -e PUID=1000 \
  -e PGID=1000 \
  -e PLEX_SECTION=Anime \
  -e PLEX_URL=http://127.0.0.1:32400 \
  -e PLEX_TOKEN=SomePlexToken \
  -e ANI_USERNAME=SomeUser \
  -e ANI_TOKEN=SomeToken \
  -e INTERVAL=3600 \
  --restart unless-stopped \
  rickdb/plexanisync:latest
```

ARM based systems (i.e. Raspberry Pi)
```
docker create \
  --name=plexanisync \
  -e PUID=1000 \
  -e PGID=1000 \
  -e PLEX_SECTION=Anime \
  -e PLEX_URL=http://127.0.0.1:32400 \
  -e PLEX_TOKEN=SomePlexToken \
  -e ANI_USERNAME=SomeUser \
  -e ANI_TOKEN=SomeToken \
  -e INTERVAL=3600 \
  --restart unless-stopped \
  rickdb/plexanisync:latest
  
# Environment Variables
| ID 	| Default 	|  Required 	| Note 	|
|---------------------	|-----------	|-----------	|-----------------------------------------------------------------------------------------------------------------------------------------------------------------	|
| PLEX_SECTION 	| Anime 	| ✅ 	| The library where your anime resides 	|
| PLEX_URL 	| localhost 	| ✅ 	| The address to your Plex Media Server, for example: http://127.0.0.1:32400 	|
| PLEX_TOKEN 	| - 	| ✅ 	| Follow [this guide](https://support.plex.tv/articles/204059436-finding-an-authentication-token-x-plex-token/) 	|
| ANI_USERNAME 	| - 	| ✅ 	| Your [AniList.co](http://www.anilist.co) username 	|
| ANI_TOKEN 	| - 	| ✅ 	| Get it [here](https://anilist.co/api/v2/oauth/authorize?client_id=1549&response_type=token) 	|
| INTERVAL 	| 3600 	| ✅ 	| The time in between syncs 	|
| CUSTOM_MAPPINGS 	| - 	| ⬜️  	| Specifiy local file or URL to a text file containing content for a [custom_mappings.ini](https://github.com/RickDB/PlexAniSync/blob/master/custom_mappings.ini.example) file 	|
| PLEX_EPISODE_COUNT_PRIORITY 	| - 	| ⬜️  	| Plex episode watched count will take priority over AniList (default = False) 	|
| SKIP_LIST_UPDATE 	| - 	| ⬜️  	| If set to True it will NOT update your AniList which is useful if you want to do a test run to check if everything lines up properly. (default = False) 	|
