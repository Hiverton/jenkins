pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            try {
                container('gradle') {
                  sh """
                    pwd
                    echo "GIT_BRANCH=${gitBranch}" >> /etc/environment
                    echo "GIT_COMMIT=${gitCommit}" >> /etc/environment
                    gradle test
                    """
                }
              }
              catch (exc) {
                println "Failed to test - ${currentBuild.fullDisplayName}"
                throw(exc)
              }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}