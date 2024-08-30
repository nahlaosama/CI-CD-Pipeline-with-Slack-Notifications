pipeline {
    agent any  
    }
    environment {
        // Define Docker Hub credentials
        DOCKER_HUB_CREDENTIALS = credentials('nahla-id')
      sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
        IMAGE_NAME = 'nahhla0220/nginx:lts'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t nginx:v1 .'
                }
            }
        }

        stage('Push') {
            steps {
                script {
                    // Log in to Docker Hub
                    sh 'echo $DOCKER_HUB_CREDENTIALS_PSW | docker login -u $DOCKER_HUB_CREDENTIALS_USR --password-stdin'
                    
                    // Push the image to Docker Hub
                    sh 'docker push nginx:v1'
                    
                    // Remove the image after pushing
                    sh 'docker rmi nginx:v1'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Pull the pushed image from Docker Hub
                    sh 'docker pull nginx:v1'
                    
                    // Run the container and expose it on port 80
                    sh 'docker run -d -p 80:80 nginx:v1'
                }
            }
        }
    }

    post {
        always {
            // Send the build status to Slack
            slackSend (
                channel: 'jenkins',
                color: currentBuild.currentResult == 'SUCCESS' ? 'good' : 'danger',
                message: "Pipeline ${currentBuild.fullDisplayName} finished with status: ${currentBuild.currentResult}"
            )
        }
    }
}

 
