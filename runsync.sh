#!/bin/bash
echo "Updating settings.ini"
python settingsupdater.py

echo "Looking for custom mapping"

if [ ! -z "${CUSTOM_MAPPINGS}" ]
then
  if test -f "${CUSTOM_MAPPINGS}"; then
    echo "Found local custom mapping file and importing: ${CUSTOM_MAPPINGS}"
    cp ${CUSTOM_MAPPINGS} /plexanisync/custom_mappings.yaml
  else
    echo "Found remote custom mapping file and importing: ${CUSTOM_MAPPINGS}"
    wget -O /plexanisync/custom_mappings.yaml ${CUSTOM_MAPPINGS}
  fi
else
  echo "No custom mapping specified"
fi

while true
do
  (cd /plexanisync && python PlexAniSync.py)
  sleep ${INTERVAL}
done
