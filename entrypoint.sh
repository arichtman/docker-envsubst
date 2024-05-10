#!/usr/bin/env sh
# Stolen from docker.io/dibi/envsubst with minor adaptations
set -e

PROCESSED=false
INPUT_PATH="${1:-/workdir}"
OUTPUT_PATH="${2:-/processed}"

for FILE_PATH in $(ls $INPUT_PATH); do
  echo "Processing ${FILE_PATH} ..."

  envsubst < "${INPUT_PATH}/${FILE_PATH}" > "${OUTPUT_PATH}/${FILE_PATH}"
  PROCESSED=true
done

ls "${OUTPUT_PATH}"

if [ ! $PROCESSED = true ]
then
  echo 'No files processed'
  exit 1
fi
