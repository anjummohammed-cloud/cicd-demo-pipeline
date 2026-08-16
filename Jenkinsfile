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
    }
}
