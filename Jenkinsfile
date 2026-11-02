pipeline {
    agent any

    environment {
        IMAGE_NAME = 'akshada'
        IMAGE_TAG  = "latest"
        CONTAINER  = "hello-jenkins-${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/aldof-itiss/hello-jenkins.git'
            }
        }

        stage('Compile') {
            steps {
                sh 'javac helloworld.java'
            }
        }

        stage('Run (JVM)') {
            steps {
                sh 'java helloworld'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${IMAGE_NAME}:${IMAGE_TAG} -t ${IMAGE_NAME}:latest .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run --name ${CONTAINER} ${IMAGE_NAME}:${IMAGE_TAG}'
            }
        }

        stage('Verify Output') {
            steps {
                script {
                    def output = sh(
                        script: 'docker logs ${CONTAINER}',
                        returnStdout: true
                    ).trim()
                    echo "Container output: ${output}"

                    if (!output.contains('Hello, World from Jenkins Pipeline!')) {
                        error 'Container output did not match the expected text.'
                    }
                    echo 'Output verified successfully.'
                }
            }
        }
    }

    post {
        always {
            sh 'docker rm -f ${CONTAINER} || true'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the logs above.'
        }
    }
}
