FROM alpine
MAINTAINER Owen Ouyang<owen.ouyang@live.com>

ENV JAVA_HOME /usr/lib/jvm/java-1.7-openjdk
ENV MAVEN_HOME /usr/share/java/maven-3
ENV PATH /usr/lib/jvm/java-1.7-openjdk/bin:$PATH

ADD pom.xml /root/pom.xml
RUN apk --update --no-cache add htop tmux wget unzip openssh-client openjdk7 git nodejs maven alpine-desktop xfce4 \
        && wget -P /tmp https://download-cf.jetbrains.com/idea/ideaIC-2017.1-no-jdk.tar.gz \
        && wget -P /tmp https://plugins.jetbrains.com/files/7212/30792/cucumber-java.zip \
        && wget -P /tmp https://plugins.jetbrains.com/files/9164/30758/gherkin.zip \
        && mkdir /opt \
        && mkdir -p /root/.IdeaIC2017.1/config/plugins/ \
        && tar xvfz /tmp/ideaIC-2017.1-no-jdk.tar.gz -C /opt \
        && unzip -d /root/.IdeaIC2017.1/config/plugins /tmp/cucumber-java.zip \
        && unzip -d /root/.IdeaIC2017.1/config/plugins /tmp/gherkin.zip \
        && ln -s /opt/idea-IC-171.3780.107/bin/idea.sh /usr/bin/idea \
        && cd /root \
        && mvn initialize \
        && rm -f /tmp/*z /tmp/*bin /tmp/*zip

ADD .config /root/.config

CMD startxfce4
