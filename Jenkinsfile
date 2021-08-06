pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                container('gradle') {
                  sh """
                    pwd
                    echo "GIT_BRANCH=${gitBranch}" >> /etc/environment
                    echo "GIT_COMMIT=${gitCommit}" >> /etc/environment
                    gradle test
                    """
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}