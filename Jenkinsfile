pipeline {
    agent any

    environment {
        def myRepo = checkout scm
        def gitCommit = GIT_BRANCH
        def gitBranch = GIT_BRANCH
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
                echo "GIT_BRANCH=${gitBranch}" >> /etc/environment
                echo "GIT_COMMIT=${gitCommit}" >> /etc/environment
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