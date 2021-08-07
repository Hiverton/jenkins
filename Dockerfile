#FROM openjdk:13
#RUN mkdir /tmp/jenkins-gradle-ci
#ADD . /tmp/jenkins-gradle-ci
#RUN chmod +x /tmp/jenkins-gradle-ci/gradlew
#WORKDIR /tmp/jenkins-gradle-ci

#RUN ls -lsah

#RUN ./gradlew clean build

#RUN ls -lsah build/libs/

#RUN mv build/libs/*.jar /tmp/jenkins-gradle-ci/app.jar

#FROM adoptopenjdk:13.0.1_9-jre-openj9-0.17.0-bionic
#COPY --from=0 /tmp/jenkins-gradle-ci/app.jar /tmp
#RUN ls /tmp
#ENTRYPOINT ["java", "-jar", "/tmp/app.jar"]
#EXPOSE 8080


FROM openjdk:14-jdk-alpine3.10
RUN mkdir /tmp/jenkins-gradle-ci
ADD . /tmp/jenkins-gradle-ci
RUN chmod +x /tmp/jenkins-gradle-ci/gradlew
RUN ./gradlew clean build
ADD build/libs/gradle-ci-0.0.1-SNAPSHOT.jar /app/app.jar
WORKDIR /app
EXPOSE 8210
CMD java -jar app.jar

