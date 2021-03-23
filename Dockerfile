FROM node:14-buster-slim

# Basic packages
RUN apt-get update && apt-get install -y \
    make \
    apt-transport-https \
    ca-certificates \
    curl \
    wget \
    gnupg \
    lsb-release \
    jq \
    git \
    sudo

# Clone my installer repo
RUN git clone https://github.com/benc-uk/tools-install.git
RUN mkdir -p /root/.local/bin

# Path update needed as a bunch of tools install into ~/.local/bin and also Go
ENV PATH $PATH:/root/.local/bin:$HOME/go/bin:/usr/local/go/bin

# Install away!
RUN ./tools-install/azure-cli.sh
RUN ./tools-install/docker-client.sh
RUN ./tools-install/helm.sh
RUN ./tools-install/golang.sh
