pipeline {
    agent any

    environment {
        def myRepo = checkout scm
    }

    stages {
        stage('Build') {
            steps {
                 echo 'Building....'
            }
        }

        stage('Test') {

            steps {
              sh 'sudo ./gradlew build'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}