FROM ubuntu:jammy
LABEL name="build-release-test"

RUN apt-get -qq update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        wget \
        git \
        ninja-build \
        sudo \
        g++-11 \
        python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip install conan --pre

RUN apt-get -qq update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        cmake \
    && rm -rf /var/lib/apt/lists/*

ARG USERNAME=test_user
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $USERNAME \
    && useradd -m -u $UID -g $GID -o -s /bin/bash $USERNAME
USER $USERNAME

RUN conan profile detect
