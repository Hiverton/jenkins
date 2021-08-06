pipeline {
    agent any

    environment {
        def myRepo = checkout scm
        def DOCKER_HUB_USER = 'hywerthon'
        def DOCKER_HUB_PASSWORD = 'n1c0l@s2013'
        def projectName = 'gradle-cli';
        def version = sh(script: "(cat gradle.properties | grep version | cut -d'=' -f2)", returnStdout: true)
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

        stage('Build') {

            steps {
              sh """
                /tmp/gradle-6.8/bin/gradle build
                """
            }
        }

        stage('run') {
          steps {
              sh """
                mv ${projectName}:${version} ./pacotes
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