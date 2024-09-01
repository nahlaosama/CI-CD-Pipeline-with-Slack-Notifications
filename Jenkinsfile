pipeline {
    agent any  
    
    environment {
        // Define Docker Hub credentials
        DOCKER_HUB_CREDENTIALS = credentials('nahla-id')
        IMAGE_NAME = 'nahhla0220/nginx'
    }
    

    stages {
        stage('Build') {
            steps {
                script {
                    // Log in to Docker Hub using the credentials
                    sh "echo \$DOCKER_HUB_CREDENTIALS_PSW | docker login -u \$DOCKER_HUB_CREDENTIALS_USR --password-stdin"
                    // Build the Docker image
                    docker { build -t nahhla0220/nginx:v1 }
                }
            }
        }

        stage('Push') {
            steps {
                script {
                  
                    // Push the image to Docker Hub
                    sh ' push nahhla0220/nginx:v1'
                    
                    // Remove the image after pushing
                    sh 'rmi nahhla0220/nginx:v1'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Pull the pushed image from Docker Hub
                    docker { pull nahhla0220/nginx:v1}
                    
                    // Run the container and expose it on port 80
                    docker { run -d -p 80:80 nahhla0220/nginx:v1}
                }
            }
        }
    }

    post {
        always {
            // Send the build status to Slack
            slackSend (
                channel: 'jenkins-notif',
                color: currentBuild.currentResult == 'SUCCESS' ? 'good' : 'danger',
                message: "Pipeline ${currentBuild.fullDisplayName} finished with status: ${currentBuild.currentResult}"
            )
        }
    }
}

 
