FROM ghcr.io/benc-uk/act-runner:base

# Path update needed
ENV PATH $PATH:$HOME/.dotnet/tools

RUN ./tools-install/dotnet.sh
