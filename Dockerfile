FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y x11-apps \
    mesa-utils \
    git \
    cmake \
    g++ \
    # GLFWのビルドに必要
    libglfw3-dev \
    # GLADのコンパイルに必要（Cコンパイラ）
    gcc \
    # OpenGLヘッダ
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    # GLFWがウィンドウを作るために必要なX11系
    libx11-dev \
    libxrandr-dev \
    libxinerama-dev \
    libxcursor-dev \
    libxi-dev \
    # あると便利
    gdb \
    make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
