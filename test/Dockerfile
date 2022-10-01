FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive
# timezone setting
RUN apt-get update && apt-get install -y tzdata
ENV TZ=Asia/Tokyo

RUN apt-get update \
    && apt-get install -y \
    curl git vim zsh sudo gcc \
    build-essential libbz2-dev libffi-dev \
    liblzma-dev libncursesw5-dev libreadline-dev \
    libsqlite3-dev libssl-dev libxml2-dev \
    libxmlsec1-dev llvm make tk-dev \
    xz-utils zlib1g-dev openssl \
    software-properties-common
RUN add-apt-repository ppa:neovim-ppa/unstable
RUN apt-get update \
    && apt-get install -y neovim

ARG USERNAME=user
ARG GROUPNAME=user
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME

USER user
COPY ./ /home/$USERNAME/dotfiles
WORKDIR /home/$USERNAME/dotfiles

RUN bash script/setup_zsh.sh
