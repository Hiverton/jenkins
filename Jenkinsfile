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
    def projectName = 'gradle-cli';
    def version = sh(script: "(cat gradle.properties | grep version | cut -d'=' -f2)", returnStdout: true)

    stage('Build') {
          sh """
            ./gradlew build
            """
    }

    stage('remove container docker') {

        try {
            sh """
                sudo docker rm -f gradle_cli_api
               """
        } catch (exc) {
          println "Não tem container rodando..."
        }

    }

    stage('build docker') {

        sh """
            sudo docker build . -t hywerthon/${projectName}:${version}
            sudo docker run -d --name gradle_cli_api -p 8210:8210 hywerthon/gradle-cli:0.0.6-SNAPSHOT
           """
    }
}

//sudo docker push docker.io/hywerthon/${projectName}:${version}
//sudo docker login -u ${DOCKER_HUB_USER} -p ${DOCKER_HUB_PASSWORD}