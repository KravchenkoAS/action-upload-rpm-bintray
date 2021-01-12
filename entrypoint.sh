#!/usr/bin/env sh

set -euf -o pipefail

FILENAME=$(echo "${INPUT_FILE}" | xargs -n 1 basename)

echo "Uploading file"
curl --silent --show-error --fail --location --request PUT --upload-file "${1}" --user "${INPUT_API_USER}:${INPUT_API_KEY}" "${INPUT_API_URL}/content/${INPUT_REPOSITORY_USER}/${INPUT_REPOSITORY}/${INPUT_PACKAGE}/${INPUT_VERSION}/${INPUT_UPLOAD_PATH}/${FILENAME};publish=${INPUT_PUBLISH}"
echo "    -> Done."