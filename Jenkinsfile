pipeline {
    agent any

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

              sh """
                pwd
                echo "GIT_BRANCH=${GIT_BRANCH}" >> /etc/environment
                echo "GIT_COMMIT=${GIT_COMMIT}" >> /etc/environment
                gradle test
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