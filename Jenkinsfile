pipeline {
    agent any
    stages {

        stage('Prepare war') {
            steps {
                script{
                    env.VERSION = sh (script: "./gradlew properties -q | grep \"version:\" | awk '{print \$2}'", returnStdout: true).trim()
                    sh "echo Building project in version: ${env.VERSION}"
                    sh './gradlew build'
                }
            }
        }
        stage('Build docker image') {
            steps {
                script{
                    withCredentials([usernamePassword(credentialsId: 'ci_docker', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        def fmkxplanner_image = docker.build("registry.fmk.netic.dk/fmk/fmk-xplanner:${env.VERSION}",'--pull .')
                        fmkxplanner_image.push()
                        fmkxplanner_image.push('latest')
                    }
                }
            }
        }

    }
    post { 
        always { 
            cleanWs()
        }
    }
}
