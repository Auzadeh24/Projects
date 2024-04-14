# Project 6 (CI/CD)

## Project Description
    A CI/CD pipeline will be deployed with Jenkins with build, test and deploy stages for a web app.
                The web app is also deployed as a container in a environment Docker Compose and AWS EKS.
                 The app will be updated on the developer’s local machine, and these changes to
                the app
                will be commited in Git and pushed to the main branch on a remote GitHub repo. This triggers a Jenkins
                CI pipeline
                to build the app as a new Docker image, test the new build and push the Docker image to Docker Hub.
                Finally,
                the Jenkins pipeline will then deploy the updated app as a container into a the container environment of
                choice
                with appropriate Docker compose, Kubernetes manifest and configuration files.
## Requirements:
**Deploy a Jenkins server on AWS:**
              1. Provision a Jenkins server on AWS using any method you prefer. 
              2. Ensure you are able to connect to the Jenkins server and log in to the Jenkins dashboard
**Deploy Container infrastructure:**
              <br>1. Provision a container environment - (Create an AWS EKS cluster to automate the infrastructure
              provisioning.</b>
              <br>2. Ensure the container environment is and ready to deploy containerized apps.
**App CI/CD with Jenkins pipeline:**
              </br>1. Create the container and Kubernetes manifest and configuration files with deployment configuration
              information for your app(s).
              <br>2. Create a Jenkinsfile containing a Jenkins pipeline with the following stages
<li>Source:</li>
              <p>This stage will execute a Git checkout of your GitHub repo containing your app source code, Dockerfile
                and Kubernetes manifest configuration files.</p>
              <li>Build:</li>
              <p>This stage will build the app’s Docker image locally on the Jenkins server.</p>
              <li>Test:</li>
              <p>This stage will execute tests for your app and stop the remaining Jenkins pipeline if the tests fail
                or move on to the next stages if the tests pass.</p>
              <li>Push:</li>
              <p>If the tests pass, this stage will then push the newly built Docker image to your Docker Hub repo.</p>
              <p></p>
              <li>Deploy:</li>
              <p>This stage gets the Jenkins server to deploy the app into the container environment by
                Docker, Docker compose, AWS EKSc. Using the corresponding Docker and/or Kubernetes manifest files.</p>