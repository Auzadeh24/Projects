# Web App Deployment on AWS Using Docker
This project aims to deploy a simple web app as a Docker container on the AWS cloud, allowing users to access the app via the public internet.
## Requirements
1.	Create a Web App: A simple web app should be created or leverage an existing one, such as those available on GitHub.
2.	Dockerize the App:
 Dockerize the web app by creating a Dockerfile with instructions to build a Docker image for the app.
3.	Create a DockerHub Account: 
If not already done, create a DockerHub account to host the Docker image.
4.	Build and Push Docker Image: 
## Build the Docker image in both x86_64 and arm64 formats using Docker Buildx tool, and push the images to DockerHub registry.
5.	Deploy the App on AWS: 
Deploy the app container on AWS by creating and launching an EC2 instance to serve as the container server.
6.	Install Docker Engine: 
## Download and install Docker engine on the EC2 server.
7.	Launch Container:
 Launch a container of the web app on the EC2 server and ensure it is accessible via the public internet.
## Documentation
### GitHub Repository
URL: Your Public GitHub Repo URL
### Architectural Diagrams
### Below are the architectural diagrams depicting the setup:<br>

<img width="615" alt="Diagram" src="https://github.com/auzadeh7049/WeCloudData-Projects/assets/150835470/99409db8-a568-4bf1-ba2d-c108666fbda5">

 
 ## Instructions for Accessing the Web App
1.	Clone the repository from GitHub: git clone https://github.com/yourusername/yourrepo.git
2.	Navigate to the cloned directory: cd yourrepo
3.	Build the Docker image(Bash codes)
“docker build -t yourusername/webapp:latest .”
4.	Push the Docker image to DockerHub:
“docker push yourusername/webapp:latest”
5.	Launch an EC2 instance on AWS and install Docker engine.
6.	Pull the Docker image from DockerHub on the EC2 instance:
“docker pull yourusername/webapp:latest”
Run the Docker container:
“docker run -d -p 80:80 yourusername/webapp:latest”
Access the web app via the public IP address of your EC2 instance.

 	
         
