pipeline {
    def myRepo = checkout scm
    def gitCommit = myRepo.GIT_COMMIT
    def gitBranch = myRepo.GIT_BRANCH

    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
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