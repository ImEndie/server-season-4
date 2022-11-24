FROM alpine:3.16.0
LABEL maintainer='UwUssimo Robinson <uwussimo@icloud.com>'

# Set default JVM options
ENV _JAVA_OPTIONS '-Xms1024M -Xmx4096M'

# Install dependencies, fetch Minecraft server jar file and chown files
RUN apk add --update ca-certificates nss tzdata wget curl \
    && apk add openjdk17-jre

# Expose port
EXPOSE 25565
EXPOSE 25575

# Set the working dir and initialize the server
WORKDIR /app
COPY . .
RUN mv server.properties.bak server.properties 

# Default run command
CMD ["java", "-jar", "./server.jar", "nogui"]