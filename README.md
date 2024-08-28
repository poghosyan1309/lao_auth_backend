# Auth Microservice

## Overview

This microservice handles user authentication and authorization for the application. It includes functionality for user registration, login, and JWT token issuance with custom claims. 

## Setup
### To clone the repository, use the following command:

```bash
$ git clone git@github.com:poghosyan1309/lao_auth_backend.git
$ cd lao_auth_backend
```


### Environment Variables

Ensure you have the required environment variables set up in a .env file or export them in your shell:

```
SECRET_KEY=your-secret-key
DB_NAME=your-database-name
DB_USER=your-database-user
DB_PASSWORD=your-database-password
DB_HOST=your-database-host
DB_PORT=5432
```

## Docker Installation
You can run the application using Docker.

1. Download and install Docker Desktop from the official Docker website:
   - [Docker Desktop ](https://www.docker.com/products/docker-desktop/)


```bash
   $ docker --version
```
## Build and Run the Application
Build the Docker image and start the containers:

```bash
$ make up
```
To stop and remove the containers:


```bash
$ make down
```
## Database Migrations
Run the following commands to apply migrations:

```bash
$ make migrate
```
To create new migrations:
```bash
$ make makemigrations
```
## Running Tests
You can run tests and check the test coverage using the following commands:

### Run Tests

```bash
$ make test
```
### Check Test Coverage

```bash
$ make coverage
```
## Help
To see a list of available commands in the Makefile:

```bash
$ make help
```

