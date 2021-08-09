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

/*
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

    stage('build docker image') {

        sh """
            sudo docker build . -t hywerthon/${projectName}:${version}
           """
    }

    stage('remove container docker') {

        try {
            sh """
                sudo docker push docker.io/hywerthon/${projectName}:${version}
               """
        } catch (exc) {
          println "Erro ao subir image para registry..."
        }

    }

    stage('run image') {

        sh """
            sudo docker run -d --name gradle_cli_api -p 8210:8210 hywerthon/gradle-cli:0.0.6-SNAPSHOT
           """
    }
}
*/
//máquina 2

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

    stage('build docker image') {

        sh """
            sudo docker build . -t hywerthon/${projectName}:${version}
           """
    }

    stage('tag an image') {

        try {
            sh """
                sudo docker login -u hywerthon -p n1c0l@s2013 docker.io
                docker tag hywerthon/${projectName}:${version} docker.io/hywerthon/gradle-cli
               """
        } catch (exc) {
          println "erro ao tag image"
        }

    }

    stage('remove container docker') {

        try {
            sh """
                sudo docker push hywerthon/${projectName}:${version}
               """
        } catch (exc) {
          println "Erro ao subir image para registry..."
        }

    }

    stage('run image') {
        try {
            sh """
                sudo docker pull -d --name gradle_cli_api -p 8210:8210 hywerthon/gradle-cli:latest
               """
        } catch (exc) {
          println "Erro ao subir image para registry..."
          println "subindo image local..."
          sh """
              sudo docker run -d --name gradle_cli_api -p 8210:8210 hywerthon/gradle-cli:0.0.6-SNAPSHOT
             """
        }

    }
}



//sudo docker push docker.io/hywerthon/${projectName}:${version}
//sudo docker login -u ${DOCKER_HUB_USER} -p ${DOCKER_HUB_PASSWORD}