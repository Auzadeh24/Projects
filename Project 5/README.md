# Project 5

## Project Description
In this project an API microservice connected to a database on AWS cloud infrastructure will be deployed. The API will have exposed endpoints that users can send HTTP requests to and get responses, with data returned as JSON payloads. The AWS infrastructure will include components like a VPC, internet gateway, public subnet, public route table, and EC2 instances.

## Requirements
**Database Creation:** <br><span style="font-weight:normal;"> Create a database to store data (e.g., NHL player stats) using any database server (MySQL, PostgreSQL, MongoDB, etc.).</span>
**API Server:** Create an API server using any programming language and framework (e.g., FastAPI, Node.js + Express, Java Spring Boot).
#**Endpoints:** Create GET endpoints for retrieving data from the database (e.g., /players, /toronto, /points).
**Deployment:** Deploy the database server and API microservice on AWS cloud, ensuring accessibility on the public internet.
##Documentation
###GitHub Repository
###Architectural Diagrams
Architectural diagram depicting the AWS cloud infrastructure setup
##Instructions
1.	Setting Up AWS Infrastructure: Follow the instructions in the provided scripts (AWS CLI, bash shell, boto3, Terraform, and/or Ansible) to provision the AWS infrastructure.
2.	Database Creation: Execute scripts or commands to create the database and import the provided data (e.g., nhl-stats-2022.csv).
3.	API Server Deployment: Deploy the API server using the chosen programming language and framework.
4.	Endpoints: Access the API endpoints using the following URLs:
•	/players: Returns the first 10 players from the data.
•	/toronto: Returns all players from the Toronto Maple Leafs.
•	/points: Returns top 10 players leading in points scored.
   

