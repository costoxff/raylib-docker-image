docker run \
	--rm -it \
	--name raylib-web \
	-u 1000:1000 \
	-p 8000:8000 \
	-v ./game:/home/user/game \
	raylib-web

