# Docker Images for Raylib Web Developement

Provide out-of-the-box simple web developed environment for raylib developers

## Dependency

Of course the **Docker Engine** , following the [offical installation](https://docs.docker.com/engine/install/).

> May be [**podman**](https://podman.io/) can be considered too

## How to start

First let me show the directory structure.

```sh
.
├── build.sh
├── Dockerfile
├── game
├── README.md
└── run-env.sh
```

| file/dir | remark |
| --- | --- |
| Dockerfile | how to build the raylib web env |
| build.sh | build the raylib web env |
| run-env.sh | run the raylib web env |
| README.md | a markdown file |
| game | a raylib game template |


### 1. build & run

Running the command below to build the docker images.

```sh
./build.sh
```

While building successfully, you can run the command:

```sh
./run-env.sh
```

> If you want to install something packages in runing container, please remove flag `--rm` in **run-env.sh**

After that your working directory will be `/home/user/game` which the host directory `game` has been mounted.

### 2. Building Project

The common way to build with cmake.

#### (a.)

```sh
mkdir build && cd build
```

#### (b.)

**emcmake** will define `-DCMAKE_TOOLCHAIN_FILE` `-DCMAKE_CROSSCOMPILING_EMULATOR` for cmake. Always adding **emcmake** before **cmake** command.

```sh
emcmake cmake ..
```

#### (c.)

The cmake will generate Makefile, so just **make** it
```sh
make
```

You will finally find the compiled file **index.html** in *web* directory.

### 3. Test it with python simple http server

The directory has been mounted, so be free to running this command in docker or your host machine.

Running the command below in *web* directory.

```sh
python3 -m http.server
```

open your browser and visit [http://localhost:8000](http://localhost:8000)

## Future Work

- [ ] Specify raylib version when building docker image
- [ ] Specify emsdk version when building docker image
- [ ] Minimize the image size
