# php-app-template
# How to Start the Project

## Prerequisites
- Docker
- Docker Compose

## Installation
1. Clone the project repository.
2. Navigate to the project root directory.
3. And run command in the terminal:
    ```
   make init
   ```
This will install build docker image, up container and install all dependencies.

## Accessing the Container Shell
- To access the bash shell of the PHP container, run the following command:
  ```
  make bash
  ```

## Stopping the Project
- Run the following command to stop the containers:
  ```
  make stop
  ```

## Removing the Project
- Run the following command to stop and remove the containers:
  ```
  make remove
  ```
  
## Running the Tests
- Run the following command to run the tests:
  ```
  make test
  ```

