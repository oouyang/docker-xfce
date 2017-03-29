FROM alpine
MAINTAINER Owen Ouyang<owen.ouyang@live.com>

ADD pom.xml /root/pom.xml
RUN apk --update --no-cache add htop tmux wget openssh-client openjdk7 git nodejs maven alpine-desktop xfce4 \
        && wget -P /tmp https://download-cf.jetbrains.com/idea/ideaIC-2017.1-no-jdk.tar.gz \
        && mkdir /opt \
        && tar xvfz /tmp/ideaIC-2017.1-no-jdk.tar.gz -C /opt \
        && ln -s /opt/idea-IC-171.3780.107/bin/idea.sh /usr/bin/idea \
        && cd /root \
        && mvn initialize \
        && rm -f /tmp/*z

ADD .config /root/.config

CMD startxfce4
