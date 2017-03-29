## docker-xfce

An alpine linux based docker image for a xfce4 desktop. At 470mb, it's half as big as the ubuntu _base_ image.

    docker run -ti --rm \
               --net=host \
               -e DISPLAY=$DISPLAY \
               -v ~/.Xauthority:/root/.Xauthority \
               -v /tmp/.X11-unix:/tmp/.X11-unix \
               xfce

Notes:

1. The "--net=host" is important for DISPLAY=localhost
2. The .Xauthority volume mount is important for xauth trust.
3. Please don't "xhost +", it makes me cry just thinking about it.
4. The /tmp/.X11-unix is for a unix domain docket based DISPLAY

If you're having problems with your DISPLAY, it's that the container either can't connect to whatever it is your DISPLAY points to, or you don't have the xauth cookie rights to talk to the X server.

