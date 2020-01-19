# Docker-PlexAniSync

A docker version of [PlexAniSync](https://github.com/RickDB/PlexAniSync) based on [Thundernerd's docker](https://github.com/Thundernerd/Docker-PlexAniSync)

<div>
  
  [![Build Status](https://img.shields.io/docker/cloud/build/rickdb/plexanisync.svg)](https://hub.docker.com/r/rickdb/plexanisync)
  
</div>

# Environment Variables
| ID 	| Default 	|  Required 	| Note 	|
|---------------------	|-----------	|-----------	|-----------------------------------------------------------------------------------------------------------------------------------------------------------------	|
| PLEX_SECTION 	| Anime 	| ✅ 	| The library where your anime resides 	|
| PLEX_URL 	| localhost 	| ✅ 	| The address to your Plex 	|
| PLEX_TOKEN 	| - 	| ✅ 	| Follow [this guide](https://support.plex.tv/articles/204059436-finding-an-authentication-token-x-plex-token/) 	|
| ANI_USERNAME 	| - 	| ✅ 	| Your [AniList.co](http://www.anilist.co) username 	|
| ANI_TOKEN 	| - 	| ✅ 	| Get it [here](https://anilist.co/api/v2/oauth/authorize?client_id=1549&response_type=token) 	|
| INTERVAL 	| 3600 	| ✅ 	| The time in between syncs 	|
| CUSTOM_MAPPINGS_URL 	| - 	| ⬜️  	| A direct link to a text file containing content for a [custom_mappings.ini](https://github.com/RickDB/PlexAniSync/blob/master/custom_mappings.ini.example) file 	|
