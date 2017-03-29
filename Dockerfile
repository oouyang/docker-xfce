FROM alpine
MAINTAINER Owen Ouyang<owen.ouyang@live.com>

ADD pom.xml /root/pom.xml
RUN apk --update --no-cache add htop tmux wget unzip openssh-client openjdk7 git nodejs maven alpine-desktop xfce4 \
        && wget -P /tmp https://download-cf.jetbrains.com/idea/ideaIC-2017.1-no-jdk.tar.gz \
        && wget -p /tmp -O cucumber-java.zip https://plugins.jetbrains.com/plugin/download?updateId=30792 \
        && wget -P /tmp -O gherkin.zip https://plugins.jetbrains.com/plugin/download?updateId=29344 \
        && mkdir /opt /root/.IdeaIC2017.1/config/plugins/ \
        && tar xvfz /tmp/ideaIC-2017.1-no-jdk.tar.gz -C /opt \
        && unzip -d /root/.IdeaIC2017.1/config/plugins /tmp/cucumber-java.zip \
        && unzip -d /root/.IdeaIC2017.1/config/plugins /tmp/gherkin.zip \
        && ln -s /opt/idea-IC-171.3780.107/bin/idea.sh /usr/bin/idea \
        && cd /root \
        && mvn initialize \
        && rm -f /tmp/*z /tmp/*zip

ADD .config /root/.config

CMD startxfce4
