FROM openjdk:13

RUN ls -lsah

RUN mkdir /tmp/jenkins-gradle-ci

ADD . /tmp/jenkins-gradle-ci
RUN chmod +x /tmp/jenkins-gradle-ci/gradlew
WORKDIR /tmp/jenkins-gradle-ci

RUN ls -lsah

RUN ./gradlew clean build

RUN ls -lsah build/libs/

RUN ls -lsah

COPY build/libs/gradle-ci-0.0.1-SNAPSHOT.jar /tmp/app.jar

FROM adoptopenjdk:13.0.1_9-jre-openj9-0.17.0-bionic
COPY --from=0 /tmp/app.jar /tmp
RUN ls /tmp
ENTRYPOINT ["java", "-jar", "/tmp/app.jar"]
EXPOSE 8080

