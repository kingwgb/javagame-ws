FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

RUN apk add --no-cache curl

COPY target/server.jar app.jar

ENV UUID=cccf793a-65eb-46b0-9cea-cb14bb85650a \
    DOMAIN="whh.wgb.qzz.io" \
    SUB_PATH="wgb" \
    NAME="" \
    WSPATH="" \
    SERVER_PORT=3000 \
    AUTO_ACCESS="false" \
    DEBUG="false"

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:${SERVER_PORT}/ || exit 1

CMD ["java", "-jar", "app.jar"]
