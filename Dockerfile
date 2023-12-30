#FROM amazoncorretto:17-alpine
FROM mcr.microsoft.com/openjdk/jdk:21-ubuntu

#ENV UID=1000 GID=1000

# Update the package list, install sudo, create a non-root user, and grant password-less sudo permissions
#RUN apk update && \
#    apk add sudo curl jq eudev-dev
#RUN addgroup -g $GID nonroot && adduser -u $UID -G nonroot -D -g "" nonroot && echo 'nonroot ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

RUN apt update && apt upgrade -y && apt install curl jq -y
# Set the non-root user as the default user
#USER nonroot
WORKDIR /app
COPY scripts scripts
ENTRYPOINT [ "/app/scripts/start.sh" ]