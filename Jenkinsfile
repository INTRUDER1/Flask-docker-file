pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', 
                    credentialsId: 'github-credentials', 
                    url: 'https://github.com/INTRUDER1/Flask-docker-file.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t my-flask-app .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    sh 'docker login -u YOUR_DOCKERHUB_USERNAME -p YOUR_DOCKERHUB_PASSWORD'
                    sh 'docker tag my-flask-app YOUR_DOCKERHUB_USERNAME/my-flask-app:latest'
                    sh 'docker push YOUR_DOCKERHUB_USERNAME/my-flask-app:latest'
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    sh 'docker run -d -p 5000:5000 YOUR_DOCKERHUB_USERNAME/my-flask-app:latest'
                }
            }
        }
    }
}
