FROM ubuntu:22.04

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    curl \
    git \
    sudo \
    vim \
    nano \
    nginx \
    docker.io

RUN service nginx start

COPY keep_alive.sh /workspace

RUN sudo chmod +x /workspace/keep_alive.sh

CMD ["/workspace/keep_alive.sh"]

RUN useradd -u 33333 -m gitpod && \
    echo "gitpod ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER gitpod

WORKDIR /workspace
