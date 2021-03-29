FROM python:3.9-slim-buster

# Basic packages
RUN apt-get update && apt-get install -y \
    make  \
    apt-transport-https \
    ca-certificates \
    curl \
    wget \
    gnupg \
    lsb-release \
    jq \
    git \
    sudo \
    gcc

USER root
ENV HOME /root

# Clone my installer repo
RUN git clone https://github.com/benc-uk/tools-install.git
RUN mkdir -p $HOME/.local/bin

# Path update needed as many installers go to $HOME/.local/bin
ENV PATH $PATH:$HOME/.local/bin

RUN ./tools-install/node.sh
RUN ./tools-install/azure-cli.sh
RUN ./tools-install/docker-client.sh
RUN ./tools-install/helm.sh

ENTRYPOINT [ "bash" ]