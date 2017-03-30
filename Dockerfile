FROM alpine
MAINTAINER Owen Ouyang<owen.ouyang@live.com>

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk 
ENV MAVEN_HOME /usr/share/java/maven-3 
ENV PATH /usr/lib/jvm/java-1.8-openjdk/bin:$PATH

ADD pom.xml /root/pom.xml
RUN apk --update --no-cache add htop tmux wget unzip openssh-client openjdk8 git nodejs maven alpine-desktop xfce4 \
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
        && npm install -g appium \
        && npm install wd \
        && wget -O "/tmp/glibc.apk" \
           "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-2.23-r3.apk" && \
           wget -O "/tmp/glibc-bin.apk" \
           "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-bin-2.23-r3.apk" && \
           apk add "/tmp/glibc.apk" "/tmp/glibc-bin.apk" \
        && rm -rf /tmp/npm* /tmp/*z /tmp/*bin /tmp/*zip

ADD .config /root/.config

CMD startxfce4
