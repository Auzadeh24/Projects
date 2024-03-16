#### Project 4
In this project, A web application will be deployed to leveraging multiple Docker images. We will orchestrate a multi-container setup using Docker Compose, hosting the web application containers environment on the AWS cloud to make it accessible via the public internet.
Project Setup
## Requirements

1. **Create or Leverage a Web App**: Develop or use a web app that is publicly available, such as on GitHub.
2. **Multiple Microservices**: The web app environment should contain 2 or more microservices that communicate with each other. For instance, it could include an API app that makes calls to a database.
3. **Dockerize the App(s) and/or Database(s)**: Create Dockerfiles with instructions to create the respective Docker images for the app(s), microservice(s), and database(s).
4. **DockerHub Account**: Create a DockerHub account if you don’t have one already and push the Docker images to your DockerHub registry.
5. **Build Docker Images**: Build the Docker images in both x86_64 and arm64 formats, for example, using Docker Buildx tool.
6. **Deploy with Docker Compose on AWS**: Deploy and orchestrate the containers with Docker Compose on AWS.
7. **EC2 Instance**: Create and launch an EC2 instance to serve as the container server to host your app containers.
8. **Install Docker Engine and Docker Compose**: On the EC2 server, download and install Docker Engine and Docker Compose.
9. **Docker Compose Configuration**: Create a docker-compose.yaml file containing the configurations necessary to run your multi-container setup with Docker Compose.
10. **Launch and Run Containers**: Launch and run your containers on the server with Docker Compose and ensure they are accessible via the public internet.

## Documentation

### GitHub Repository
[Public GitHub Repo](link-to-your-github-repo)

### Architectural Diagrams
Include architectural diagrams depicting the AWS cloud infrastructure setup, the web app architecture, and any other pertinent visualizations.

### Access Instructions
1. Clone the GitHub repository to your local machine.
2. Ensure you have Docker and Docker Compose installed on your system.
3. Navigate to the project directory containing the docker-compose.yaml file.
4. Run the following command to start the containers:
5. Once the containers are up and running, access the web app via the public IP or DNS of your EC2 instance.






