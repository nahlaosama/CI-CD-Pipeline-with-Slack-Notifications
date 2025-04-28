# CI/CD Pipeline with Slack Notifications

## Project Description
This project implements a **basic CI/CD pipeline** using **Jenkins** to automate the process of building, pushing, and deploying a Docker image.  
It also sends a Slack notification to update the team about the pipeline status.

## Technologies Used
- **Jenkins** – for pipeline orchestration
- **Docker** – for containerization
- **Docker Hub** – as the container registry
- **Slack** – for build notifications

## Pipeline Stages

| Stage   | Description |
|---------|-------------|
| **Build** | - Log in to Docker Hub using Jenkins credentials.<br>- Build the Docker image from the Dockerfile. |
| **Push**  | - Push the built Docker image to Docker Hub.<br>- Remove the local image to free up space. |
| **Deploy**| - Pull the Docker image from Docker Hub.<br>- Run the container and expose it on port 80. |
| **Post Actions** | - Send a notification to a Slack channel indicating whether the build succeeded or failed. |

## How it Works
1. Jenkins starts the pipeline automatically or manually.
2. In the **Build** stage, the application is containerized by building a Docker image.
3. In the **Push** stage, the Docker image is pushed to a personal Docker Hub repository.
4. In the **Deploy** stage, the image is pulled back and run as a container accessible via port 80.
5. Finally, a **Slack notification** is sent with the build result.

## Prerequisites
- Docker installed on the Jenkins server
- Jenkins configured with:
  - Docker plugin
  - Slack integration plugin
- A valid Docker Hub account and credentials saved in Jenkins
- A configured Slack Webhook and channel

## Repository Structure
├── Jenkinsfile # Defines the CI/CD pipeline ├── Dockerfile # Defines how the Docker image is built ├── README.md # Project documentation

markdown
Copy
Edit

## Future Improvements
- Add automated testing before the build stage
- Use Docker Compose or Kubernetes for advanced deployment
- Add rollback strategy in case of deployment failure

## Author
Nahla Osama
