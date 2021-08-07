/*pipeline {
    agent any

    stages {

        stage('Test') {

            steps {
              sh """
                ./gradlew build
                """
            }
        }

    }

}*/


node('slave-01') {

    def myRepo = checkout scm
    def DOCKER_HUB_USER = 'hywerthon'
    def DOCKER_HUB_PASSWORD = 'n1c0l@s2013'
    def projectName = 'gradle-cli';
    def version = sh(script: "(cat gradle.properties | grep version | cut -d'=' -f2)", returnStdout: true)

    stage('Build') {
          sh """
            ./gradlew build
            """
    }

    stage('build docker') {

        sh """
            sudo docker login -u ${DOCKER_HUB_USER} -p ${DOCKER_HUB_PASSWORD}
            sudo docker build . -t hywerthon/${projectName}:${version}
            sudo docker tag hywerthon/${projectName}:${version} hywerthon/gradle-cli:last
            sudo docker push docker.io/hywerthon/${projectName}:${version}
           """
    }
}
