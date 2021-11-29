FROM openjdk:8
ARG JAR_FILE=target/*.jar
WORKDIR /app
COPY ${JAR_FILE} push0.1.1.jar
COPY ./config  /app/config
COPY ./config  /app/fcm
ENV TZ=Asia/Dubai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN mkdir -p /home/ubuntu/images
ENTRYPOINT ["java","-jar","push0.1.1.jar"]