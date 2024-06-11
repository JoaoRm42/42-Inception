# 42 Project Inception

Welcome to the 42 Project Inception repository! This project is part of the curriculum at 42, a globally recognized coding school. The goal of this project is to dive deep into system administration by setting up a WordPress website with multiple services using Docker.

## Table of Contents
- [Introduction](#introduction)
- [Project Objectives](#project-objectives)
- [Requirements](#requirements)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [Acknowledgments](#acknowledgments)

## Introduction

Inception is a system administration project that aims to familiarize students with Docker and the setup of a web infrastructure. By completing this project, students will gain hands-on experience with containerization, network configuration, and service orchestration.

## Project Objectives

- Set up a multi-container environment using Docker.
- Configure a web server to serve a WordPress site.
- Implement a reverse proxy using Nginx.
- Set up a database server for the WordPress site.
- Secure the services with SSL/TLS.
- Create Dockerfiles and Compose files to automate the setup.

## Requirements

- A basic understanding of Docker and containerization concepts.
- Familiarity with web servers, databases, and network configuration.
- Access to a Unix-based system (Linux or macOS).

## Project Structure

Here's a brief overview of the project structure:
```
.
├── srcs
│ ├── requirements
│ │ ├── wordpress
│ │ │ ├── Dockerfile
│ │ │ └── ...
│ │ ├── nginx
│ │ │ ├── Dockerfile
│ │ │ └── ...
│ │ ├── mariadb
│ │ │ ├── Dockerfile
│ │ │ └── ...
│ ├── docker-compose.yml
│ └── .env
└── README.md
```

- **srcs/**: Contains all the source files for the project.
  - **requirements/**: Contains subdirectories for each service (WordPress, Nginx, MariaDB).
  - **docker-compose.yml**: The Compose file to set up the multi-container environment.
  - **.env**: Environment variables file.

## Installation

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/joaoped2-42PORTO/Inception.git
    cd Inception
    ```

2. **Set Up Environment Variables**:
    Go to `./srcs/.env` and add the necessary environment variables:
    ```
    SPUSR_WP         =
    SPUSR_PWD_WP     =
    SPUSR_EMAIL_WP   =
    USR_WP           =
    USR_PWD_WP       =
    USR_EMAIL_WP     =
    DB_USER          =
    DB_USER_PSWD     =
    DB_ROOT_PSWD     =
    DB_HOST          =
    DB               =
    DOMAIN           =
    TITLE_WP         =
    PATH_WP          =
    AUTH_KEY         =
    SECURE_AUTH_KEY  =
    LOGGED_IN_KEY    =
    NONCE_KEY        =
    AUTH_SALT        =
    SECURE_AUTH_SALT =
    LOGGED_IN_SALT   =
    NONCE_SALT       =
    ```
    
3. **Edit Makefile line 26**
   ```
    sudo sed -i '/^127.0.0.1/ {/joaoped2.42.fr/! s/localhost/localhost joaoped2.42.fr/}' /etc/hosts
   ```
   to
   ```
   sudo sed -i '/^127.0.0.1/ {/yourlogin.42.fr/! s/localhost/localhost yourlogin.42.fr/}' /etc/hosts
   ```
   
4. **Build and Run the Containers**:
    ```
    make all
    ```

## Usage

- Access the WordPress site at `http://yourlogin.42.fr` (or the domain you've configured).
- The Nginx reverse proxy is configured to handle requests and route them to the appropriate service.
- The MariaDB database is set up to store the WordPress data.

## Contributing

Contributions are welcome! If you have any suggestions or improvements, feel free to create an issue or submit a pull request. Please ensure that your contributions adhere to the coding standards and guidelines of the project.

## Acknowledgments

- The 42 Network for providing the inspiration and resources for this project.
- The Docker and WordPress communities for their excellent documentation and support.
- All contributors who have helped improve this project.

---

Happy coding!
