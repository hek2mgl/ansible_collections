FROM debian:bookworm

RUN apt-get update \
    && apt-get install -y \
        systemd \
        python3 \
        sudo \
    && useradd -m ansible \
    && echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible
