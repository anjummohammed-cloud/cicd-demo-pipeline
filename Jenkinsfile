pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        ECR_REPO = '289896345323.dkr.ecr.us-east-1.amazonaws.com/cicd-demo-app'
    }

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

        stage('Push to ECR') {
            steps {
                sh '''
                    aws ecr get-login-password --region $AWS_REGION |
                    docker login --username AWS --password-stdin $ECR_REPO

                    docker tag cicd-demo-app:latest $ECR_REPO:latest

                    docker push $ECR_REPO:latest
                '''
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
