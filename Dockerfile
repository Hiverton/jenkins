FROM openjdk:13
RUN mkdir /tmp/jenkins
ADD . /tmp/jenkins
RUN chmod +x /tmp/jenkins/gradlew
WORKDIR /tmp/jenkins
RUN ls -lsah
RUN ./gradlew clean build
RUN mv /tmp/jenkins/build/libs/*.jar /tmp/app.jar

FROM adoptopenjdk:13.0.1_9-jre-openj9-0.17.0-bionic
COPY --from=0 /tmp/app.jar /tmp
RUN ls /tmp
ENTRYPOINT ["java", "-jar", "/tmp/app.jar"]
EXPOSE 8080

