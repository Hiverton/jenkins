pipeline {
    agent any

    environment {
        def myRepo = checkout scm
        def DOCKER_HUB_USER = 'hywerthon'
        def DOCKER_HUB_PASSWORD = 'n1c0l@s2013'
    }

    stages {
        stage('Test') {
            steps {
                 echo 'Building....'
            }
        }

        stage('Build') {

            steps {
              sh """
                /tmp/gradle-6.8/bin/gradle build
                """
            }
        }

        stage('Create Docker images') {
          container('docker') {
              sh """
                docker login -u ${DOCKER_HUB_USER} -p ${DOCKER_HUB_PASSWORD}
                docker build . -t hywerthon/${projectName}:${version}
                docker push hywerthon/${projectName}:${version}
                """
          }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }

    }
}