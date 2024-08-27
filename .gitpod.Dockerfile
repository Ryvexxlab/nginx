FROM ubuntu:22.04

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    curl \
    git \
    sudo \
    vim \
    nano \
    docker.io

RUN groupadd -g 33333 gitpod || true

RUN useradd -u 1000 -g 33333 -m gitpod && \
    echo "gitpod ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER gitpod

WORKDIR /workspace
