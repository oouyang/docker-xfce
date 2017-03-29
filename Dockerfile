FROM alpine
MAINTAINER Owen Ouyang<owen.ouyang@live.com>

RUN apk --update --no-cache add htop tmux wget openssh-client git maven npm alpine-desktop xfce4 \
	&& wget -P /tmp https://download-cf.jetbrains.com/idea/ideaIC-2017.1.tar.gz \
        && tar xvfz /tmp/ideaIC-2017.1.tar.gz -C /opt \
        && ln -s /opt/idea-IC-171.3780.107/bin/idea.sh /usr/bin/idea \
        && rm -f /tmp/*z

ADD .config /root/.config

CMD startxfce4
