pipeline {
    agent any

    environment {
        REGISTRY = "docker.io"
        IMAGE_NAME = "lucacisotto/formazione_openshift_4"
        TAG = "latest"
    }

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    // Clona il repository GitHub
                    git 'https://github.com/lucacis8/formazione_openshift_4.git'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Costruisce l'immagine Docker
                    sh 'docker build -t ${REGISTRY}/${IMAGE_NAME}:${TAG} .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Effettua il login su DockerHub usando le credenziali di Jenkins
                    withCredentials([usernamePassword(credentialsId: 'dockerhub_credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'docker login --username $DOCKER_USERNAME --password-stdin'
                    }

                    // Push dell'immagine nel registry
                    sh 'docker push ${REGISTRY}/${IMAGE_NAME}:${TAG}'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Applica il deployment a Kubernetes
                    sh 'kubectl apply -f deployment.yaml'
                }
            }
        }
    }

    post {
        always {
            // Pulizia: rimuove l'immagine Docker localmente
            script {
                sh 'docker rmi ${REGISTRY}/${IMAGE_NAME}:${TAG}'
            }
        }
    }
}
