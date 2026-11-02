pipeline {
    agent any

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

        stage('Run') {
            steps {
                sh 'java helloworld'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the logs above.'
        }
    }
}
