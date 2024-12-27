pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Clone the repository
                git url: 'https://github.com/Pranav8722/container-security.git', branch: 'master'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image using the Dockerfile in the images directory
                    bat 'docker build -t pranav224/container-security-image:latest -f images/Dockerfile .'
                }
            }
        }
        // stage('Scan Docker Image') {
        //     steps {
        //         script {
        //             // Scan the Docker image
        //             bat 'docker scan pranav224/container-security-image:latest'
        //         }
        //     }
        // }
        stage('Scan Docker Image with Trivy') {
    steps {
        script {
            bat "trivy image pranav224/container-security-image:latest"
        }
    }
}

        stage('Push Docker Image') {
            steps {
                script {
                    // Log in to Docker Hub and push the Docker image
                    bat '''
                    echo %DOCKER_HUB_PASSWORD% | docker login -u %DOCKER_HUB_USERNAME% --password-stdin
                    docker push pranav224/container-security-image:latest
                    '''
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Deploy to Kubernetes using kubectl
                    bat 'kubectl apply -f k8s-deployment.yaml'
                }
            }
        }
    }
    post {
        always {
            echo 'Pipeline completed.'
        }
        failure {
            echo 'Pipeline failed. Check logs.'
        }
    }
}
