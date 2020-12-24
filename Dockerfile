FROM alpine:latest

#LABEL "maintainer"="KravchenkoAS"
#LABEL "com.github.actions.name"="action-upload-rpm-bintray"
#LABEL "com.github.actions.description"="Upload files to JFrog Bintray"
#LABEL "com.github.actions.icon"="upload"
#LABEL "com.github.actions.color"="green"

RUN apk --no-cache add curl
#RUN apt-get update && apt-get -y install curl git

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]