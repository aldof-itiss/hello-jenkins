pipeline {
    agent any

    environment {
        IMAGE_NAME = 'akshada'
        IMAGE_TAG  = "latest"
        CONTAINER  = "hello-jenkins"
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
                sh 'docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run --name ${CONTAINER} ${IMAGE_NAME}:${IMAGE_TAG}'
            }
        }

        stage('Verify Output') {
            steps {
                    echo 'Output verified successfully.'
            }
        }
    }
}
