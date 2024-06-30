FROM ubuntu:jammy

ARG RAYLIB_VERSION=4.5.0

SHELL ["/bin/bash", "-c"]

# user
RUN useradd user -m -G sudo -s /usr/bin/bash && passwd -d user

# package
RUN apt update && apt install -y \
build-essential git cmake libasound2-dev libx11-dev libxrandr-dev libxi-dev \
libgl1-mesa-dev libglu1-mesa-dev libxcursor-dev libxinerama-dev \
libwayland-dev libxkbcommon-dev python3

# emsdk
WORKDIR /opt
RUN git clone https://github.com/emscripten-core/emsdk.git

WORKDIR /opt/emsdk
## https://stackoverflow.com/q/20635472
RUN ./emsdk install latest \
&& ./emsdk activate latest \
&& echo 'source "/opt/emsdk/emsdk_env.sh"' >> /root/.bashrc \
&& echo 'source "/opt/emsdk/emsdk_env.sh"' >> /home/user/.bashrc
## expose port for python simple http server
EXPOSE 8000

# raylib
WORKDIR /opt
RUN git clone --depth 1 --branch ${RAYLIB_VERSION} \
https://github.com/raysan5/raylib.git raylib

WORKDIR /opt/raylib/src
RUN source "/opt/emsdk/emsdk_env.sh" \
&& make PLATFORM=PLATFORM_WEB -B -e \
&& make install

WORKDIR /home/user/game
