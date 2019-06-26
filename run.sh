java $JAVA_OPTS -jar /app/k8s-sc-eureka.jar \
    -Djava.security.egd=file:/dev/./urandom \
    --config.profile=$CONFIG_PROFILE \
    --diy.eureka.server.port=$DIY_EUREKA_SERVER_PORT \
    --diy.eureka.user=$DIY_EUREKA_USER \
    --diy.eureka.password=$DIY_EUREKA_PASSWORD \
    --diy.eureka.host.master=$DIY_EUREKA_HOST_MASTER \
    --diy.eureka.host.backup01=$DIY_EUREKA_HOST_BACKUP01 \
    --diy.eureka.host.backup02=$DIY_EUREKA_HOST_BACKUP02 \
