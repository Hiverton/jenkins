pipeline {
    agent any

    stages {

        stage('Test') {

            steps {
              sh """
                /tmp/gradle-6.8/bin/gradle test
                """
            }
        }

    }

}


node('slave-01') {

    def myRepo = checkout scm
    def DOCKER_HUB_USER = 'hywerthon'
    def DOCKER_HUB_PASSWORD = 'n1c0l@s2013'
    def projectName = 'gradle-cli';
    def version = sh(script: "(cat gradle.properties | grep version | cut -d'=' -f2)", returnStdout: true)

    stage('build docker') {

        sh """
            ls
            sudo ./gradlew clean build

            sudo docker login -u ${DOCKER_HUB_USER} -p ${DOCKER_HUB_PASSWORD}
            sudo docker build . -t hywerthon/${projectName}:${version}
            sudo docker push hywerthon/${projectName}:${version}
           """
    }
}
