pipeline {
    agent {
        agent('gradle')
    }

    environment {
        def myRepo = checkout scm
    }

    stages {
        stage('Build') {
            steps {
                 sh 'printenv'
            }
        }

        stage('Test') {

            steps {
              sh ' gradle test'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}