FROM rockylinux:8
MAINTAINER madebymode

ARG HOST_USER_UID=1000
ARG HOST_USER_GID=1000

RUN dnf -y update \
    && dnf -y install --nogpgcheck --setopt=tsflags=nodocs --setopt=install_weak_deps=False \
        dnf-utils \
        epel-release \
    && dnf -y install --nogpgcheck --setopt=tsflags=nodocs --setopt=install_weak_deps=False \
        curl \
        wget \
        gcc-c++ \
        make \
        git \
        bzip2 \
        sudo \
        which \
        rsync \
        mysql \
        GraphicsMagick \
        libpng-devel \
        zlib \
        autoconf \
    && curl -sL https://rpm.nodesource.com/setup_24.x | bash - \
    && curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo \
    && dnf install -y --nogpgcheck --setopt=tsflags=nodocs --setopt=install_weak_deps=False \
        nodejs \
        yarn \
    && dnf clean all \
    && rm -rf /var/cache/dnf /tmp/* \
    && groupadd -g $HOST_USER_GID docker \
    && useradd -lm -u $HOST_USER_UID -g $HOST_USER_GID docker \
    && usermod -aG wheel,tty docker \
    && echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker
