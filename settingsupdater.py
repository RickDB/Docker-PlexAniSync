import configparser
import os

config = configparser.ConfigParser()

config['PLEX'] = {
	'anime_section': os.environ.get('PLEX_SECTION'),
	'authentication_method': 'direct',
	'base_url': os.environ.get('PLEX_URL'),
	'token': os.environ.get('PLEX_TOKEN'),
}

config['ANILIST'] = {
	'username': os.environ.get('ANI_USERNAME'),
	'access_token': os.environ.get('ANI_TOKEN'),
	'plex_episode_count_priority':False,
	'skip_list_update':False
}

with open('/plexanisync/settings.ini', 'w') as configfile:
	config.write(configfile)
