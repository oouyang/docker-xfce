FROM alpine
MAINTAINER Owen Ouyang<owen.ouyang@live.com>

RUN apk update && apk add openssh-client git maven npm alpine-desktop xfce4

CMD startxfce4
