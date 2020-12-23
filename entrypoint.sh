#!/usr/bin/env sh

set -euf -o pipefail

FILENAME=$(echo "${INPUT_FILE}" | xargs -n 1 basename)

HEADER_RPM_DISTRIBUTION=""
if [ "${INPUT_RPM_DISTRIBUTION}" != "" ]
then
    HEADER_RPM_DISTRIBUTION="X-Bintray-Rpm-Distribution: ${INPUT_RPM_DISTRIBUTION}"
fi

HEADER_RPM_COMPONENT=""
if [ "${INPUT_RPM_COMPONENT}" != "" ]
then
    HEADER_RPM_COMPONENT="X-Bintray-Rpm-Component: ${INPUT_RPM_COMPONENT}"
fi

HEADER_RPM_ARCHITECTURE=""
if [ "${INPUT_RPM_ARCHITECTURE}" != "" ]
then
    HEADER_RPM_ARCHITECTURE="X-Bintray-Rpm-Architecture: ${INPUT_RPM_ARCHITECTURE}"
fi

echo "Uploading file"
curl --silent --show-error --fail --location --request PUT --upload-file "${1}" --user "${INPUT_API_USER}:${INPUT_API_KEY}" -H "${HEADER_RPM_DISTRIBUTION}" -H "${HEADER_RPM_COMPONENT}" -H "${HEADER_RPM_ARCHITECTURE}" "${INPUT_API_URL}/content/${INPUT_REPOSITORY_USER}/${INPUT_REPOSITORY}/${INPUT_PACKAGE}/${INPUT_VERSION}/${INPUT_UPLOAD_PATH}/${FILENAME};publish=${INPUT_PUBLISH}"
echo "    -> Done."