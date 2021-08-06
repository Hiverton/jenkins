pipeline {
    agent any

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

        stage('run') {

          steps {
              sh """
                cd build
                ls
                """
          }
        }

    }

}

node('slave-01') {

    environment {
        def myRepo = checkout scm
        def DOCKER_HUB_USER = 'hywerthon'
        def DOCKER_HUB_PASSWORD = 'n1c0l@s2013'
        def projectName = 'gradle-cli';
        def version = sh(script: "(cat gradle.properties | grep version | cut -d'=' -f2)", returnStdout: true)
    }


    step
        echo 'Building....'



        /*stage('build docker') {
            steps {
                 sh """
                    docker login -u ${DOCKER_HUB_USER} -p ${DOCKER_HUB_PASSWORD}
                    docker build . -t hywerthon/${projectName}:${version}
                    docker push hywerthon/${projectName}:${version}
                    """
            }
        }*/




}