FROM ghcr.io/benc-uk/act-runner:base

# Path update needed
ENV PATH $PATH:$HOME/go/bin:/usr/local/go/bin

RUN ./tools-install/golang.sh
