# Assessment: Dockerize a Simple Web Application with Docker Compose
## Goal: 
Build and deploy a 3-container architecture using Docker and Docker Compose for a web application that handles incoming requests, communicates with a MySQL database, and serves responses through an nginx reverse proxy.
Instructions:

    Web Application:
        Develop a simple web application in a language of your choice (e.g., Python Flask, Node.js, or others).
        Implement at least two routes:
            /health: returns 200 OK with a simple JSON response (e.g., {"status": "healthy"}).
            /data: fetches and displays some test data from the MySQL database.
        The application server must listen for requests on port 4743 only.

    Containers:

        Nginx Container:
            Use the official nginx image.
            Configure it as a reverse proxy:
                All HTTP traffic from port 5423 on the host must route to port 824 inside the container.
                It has to forward all requests at /health and /data to the app container
            Connect to the app service on the site_network.

        Application Container:
            Build your own image from the app's Dockerfile (name: app).
            Ensure it connects to:
                The mysql service via db_network.
                The nginx service via site_network.

        MySQL Container:
            Build your own image from a Dockerfile (name: mysql).
            Configure the database to listen on port 5655.
            Persist data in the db_volume volume.

    Volumes and Networks:
        Create:
            A db_volume volume for the database container.
            Two networks:
                db_network: links mysql and app.
                site_network: links nginx and app.

    Dependencies and Healthchecks:
        Add healthchecks to ensure services start in the correct order:
            Database: Include a healthcheck in its Dockerfile
            App: Add a healthcheck in docker-compose.yaml that waits for the database to be ready.
            Nginx: Depend on the app's health in docker-compose.yaml.

    Naming Conventions:
        Name your images and containers as follows:
            Image for nginx: nginx.
            Image for the app: app.
            Image for MySQL: mysql.
            MySQL container: mysql_container with alias mysql on db_network.
            App container: Alias app on site_network.

    Directory Structure:
        Organize your project as follows:

        ./
        ├── app/
        │   ├── Dockerfile 
        │   ├── conf/ 
        │   └── src/ 
        ├── compose.yaml 
        ├── mysql/
        │   ├── Dockerfile 
        │   └── conf/ 
        └── nginx/
            ├── Dockerfile 
            └── conf/ 

    Deliverables:
        A functioning docker-compose.yaml file.
        Working Dockerfiles for all images.
        Config files for nginx and MySQL (if applicable).
        The source code for the application.
        Ensure the project builds and runs successfully with docker compose up --build

Evaluation Criteria:

    All services are functional and meet the port and network requirements.
    Routes in the app are accessible and functional.
    Proper volume and network configuration.
    Correct implementation of healthchecks and dependencies.
    Adherence to naming conventions and directory structure.
