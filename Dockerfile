
# base image
# debian:10-slim/buster-slim
FROM debian@sha256:b586cf8c850cada85a47599f08eb34ede4a7c473551fd7c68cbf20ce5f8dbbf1

# install packages
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y apt-transport-https ca-certificates gnupg2 curl && \
	rm -rf /var/lib/apt/lists/*

# install gcloud
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && \
	echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
	apt-get update -y && \
	apt-get install -y google-cloud-sdk && \
	mkdir -p /.config/gcloud && \
	chown -R 1001 /.config/gcloud

# set current dir
WORKDIR /usr/bin

# set user
USER 1001

# entrypoint
ENTRYPOINT ["/bin/sh", "-c", "while :; do echo 'going to sleep for an hour, see ya later...'; sleep 3600; done"]
