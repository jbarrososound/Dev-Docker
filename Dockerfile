FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    GOPATH=/home/dev/go \
    PATH=/home/dev/.local/bin:/home/dev/go/bin:/home/dev/.cargo/bin:$PATH

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash-completion \
    build-essential \
    ca-certificates \
    cmake \
    composer \
    curl \
    file \
    gdb \
    git \
    golang-go \
    jq \
    openjdk-21-jdk-headless \
    php-cli \
    php-curl \
    php-mbstring \
    php-xml \
    php-zip \
    pkg-config \
    python3 \
    python3-pip \
    python3-venv \
    ripgrep \
    ruby-full \
    rustc \
    cargo \
    shellcheck \
    sudo \
    unzip \
    wget \
    xz-utils \
    zip \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/* \
    && ln -sf /usr/bin/python3 /usr/local/bin/python \
    && npm install --global typescript tsx \
    && (getent group dev >/dev/null || groupadd dev) \
    && useradd --gid dev --create-home --shell /bin/bash dev \
    && printf 'dev ALL=(ALL) NOPASSWD:ALL\n' > /etc/sudoers.d/dev \
    && chmod 0440 /etc/sudoers.d/dev \
    && mkdir -p /workspace /home/dev/go /home/dev/.cargo \
    && chown -R dev:dev /workspace /home/dev

WORKDIR /workspace
USER dev

CMD ["sleep", "infinity"]
