pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps {
                echo 'Running application tests...'
            }
        }

        stage('Docker Build') {
            steps {
                dir('app') {
                    sh 'docker build -t cicd-demo-app .'
                }
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    docker rm -f cicd-demo-app 2>/dev/null || true
                    docker run -d -p 8081:5000 --name cicd-demo-app cicd-demo-app
                '''
            }
        }

        stage('Verify') {
            steps {
                sh '''
                    sleep 5
                    docker ps --filter "name=cicd-demo-app"
                '''
            }
        }
    }
}
