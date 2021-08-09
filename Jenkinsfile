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

    stage('build docker image') {

        sh """
            sudo docker build . -t hywerthon/gradle-cli
           """
    }

    stage('login') {

        try {
            sh """
                sudo docker login -u hywerthon -p n1c0l@s2013 docker.io
               """
        } catch (exc) {
          println "erro ao se logar"
        }

    }

    stage('tag an image') {

        try {
            sh """
                sudo docker tag hywerthon/gradle-cli docker.io/hywerthon/gradle-cli:${version}
               """
        } catch (exc) {
          println "erro ao tag image"
        }
    }

    stage('push image docker') {

        try {
            sh """
                sudo docker push docker.io/hywerthon/gradle-cli:${version}
               """
        } catch (exc) {
          println "Erro ao subir image para registry..."
        }

    }

     stage('remove an image local') {
         try {
             sh """
                 sudo docker rmi docker.io/hywerthon/gradle-cli:${version}
                """
         } catch (exc) {
           println "Erro ao remover uma image"
         }

    }

    stage('pull image') {
        try {
            sh """
                sudo docker pull docker.io/hywerthon/gradle-cli:${version}
               """
        } catch (exc) {
          println "Erro ao puxar image para registry..."
        }
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

    stage('run image') {
        try {
            sh """
                sudo docker run -d --name gradle_cli_api -p 8210:8210 docker.io/hywerthon/gradle-cli:${version}
               """
        } catch (exc) {
          println "Erro ao subir image para registry..."
          println "subindo image local..."
          sh """
              sudo docker run -d --name gradle_cli_api -p 8210:8210 hywerthon/gradle-cli
             """
        }
    }
}


node('slave-02') {

    def myRepo = checkout scm
    def projectName = 'gradle-cli';
    def version = sh(script: "(cat gradle.properties | grep version | cut -d'=' -f2)", returnStdout: true)

    stage('remove container docker') {

        try {
            sh """
                sudo docker rm -f gradle_cli_api
               """
        } catch (exc) {
          println "Não tem container rodando..."
        }

    }

    stage('run image') {
        try {
            sh """
                sudo docker run -d --name gradle_cli_api -p 8210:8210 docker.io/hywerthon/gradle-cli:${version}
               """
        } catch (exc) {
          println "Erro ao subir image para registry..."
          println "subindo image local..."
        }
    }
}




//sudo docker push docker.io/hywerthon/${projectName}:${version}
//sudo docker login -u ${DOCKER_HUB_USER} -p ${DOCKER_HUB_PASSWORD}