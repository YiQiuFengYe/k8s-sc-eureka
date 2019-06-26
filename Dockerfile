FROM maven:3.6-alpine as BUILD

COPY settings.xml /usr/share/maven/ref/
COPY src /usr/app/src
COPY pom.xml /usr/app

RUN mvn -f /usr/app/pom.xml -s /usr/share/maven/ref/settings.xml clean package -Dmaven.test.skip=true

FROM openjdk:8-jdk-alpine

ADD ./run.sh /

ENV JAVA_OPTS=""
ENV CONFIG_PROFILE="default"
ENV DIY_EUREKA_SERVER_PORT="8761"
ENV DIY_EUREKA_USER="smile"
ENV DIY_EUREKA_PASSWORD="smilelxy"
ENV DIY_EUREKA_HOST_MASTER="eureka-master.default.svc.cluster.info"
ENV DIY_EUREKA_HOST_BACKUP01="eureka-backup01.default.svc.cluster.info"
ENV DIY_EUREKA_HOST_BACKUP02="eureka-backup02.default.svc.cluster.info"
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV TZ=Asia/Shanghai

RUN mkdir /app
RUN chmod +x /run.sh

WORKDIR /app

COPY --from=BUILD /usr/app/target/k8s-sc-eureka-*.jar /app/k8s-sc-eureka.jar

EXPOSE 8761

ENTRYPOINT [ "sh", "-c", "/run.sh" ]