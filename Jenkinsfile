pipeline {
    agent any

    stages {

        stage('Test') {
            steps {
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
            }
        }

        stage('Build') {
            steps {
                echo 'Building..'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}