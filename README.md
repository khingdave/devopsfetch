# DevOpsFetch

DevOpsFetch is a tool designed for DevOps to retrieve and display server information, including active ports, user logins, Nginx configurations, Docker images, and container statuses. It also provides a continuous monitoring mode with logging capabilities.

## Features

- Display all active ports and services
- Provide detailed information about a specific port
- List all Docker images and containers
- Provide detailed information about a specific Docker container
- Display all Nginx domains and their ports
- Provide detailed configuration information for a specific Nginx domain
- List all users and their last login times
- Provide detailed information about a specific user
- Display activities within a specified time range
- Continuous monitoring and logging

## Installation

### Prerequisites

- Ubuntu or any Debian-based system
- Nginx
- Docker

### Steps

1. Clone the repository or download the `devopsfetch.sh` and `setup.sh` scripts.

    ```bash
    git clone https://github.com/yourusername/devopsfetch.git
    cd devopsfetch
    ```

2. Make the scripts executable.

    ```bash
    chmod +x devopsfetch.sh
    chmod +x setup.sh
    ```

3. Run the setup script to install dependencies and set up the systemd service.

    ```bash
    sudo ./setup.sh
    ```

## Usage

### Display all active ports and services

```bash
./devopsfetch.sh -p
- Provide detailed information about a specific port

./devopsfetch.sh -d
List all Docker images and containers

Provide detailed information about a specific Docker container
./devopsfetch.sh -d <container_name>

Display all Nginx domains and their ports
./devopsfetch.sh -n

Provide detailed configuration information for a specific Nginx domain
./devopsfetch.sh -n <domain>

List all users and their last login times
./devopsfetch.sh -u

Provide detailed information about a specific user
./devopsfetch.sh -u <username>

Display activities within a specified time range
./devopsfetch.sh -t "YYYY-MM-DD HH:MM:SS" "YYYY-MM-DD HH:MM:SS"

Enable continuous monitoring and logging
./devopsfetch.sh -l

Help
To show help message:
./devopsfetch.sh -h



Sure! Here's a detailed README.md file for the bash solution:

markdown
Copy code
# DevOpsFetch

DevOpsFetch is a tool designed for DevOps to retrieve and display server information, including active ports, user logins, Nginx configurations, Docker images, and container statuses. It also provides a continuous monitoring mode with logging capabilities.

## Features

- Display all active ports and services
- Provide detailed information about a specific port
- List all Docker images and containers
- Provide detailed information about a specific Docker container
- Display all Nginx domains and their ports
- Provide detailed configuration information for a specific Nginx domain
- List all users and their last login times
- Provide detailed information about a specific user
- Display activities within a specified time range
- Continuous monitoring and logging

## Installation

### Prerequisites

- Ubuntu or any Debian-based system
- Nginx
- Docker

### Steps

1. Clone the repository or download the `devopsfetch.sh` and `setup.sh` scripts.

    ```bash
    git clone https://github.com/yourusername/devopsfetch.git
    cd devopsfetch
    ```

2. Make the scripts executable.

    ```bash
    chmod +x devopsfetch.sh
    chmod +x setup.sh
    ```

3. Run the setup script to install dependencies and set up the systemd service.

    ```bash
    sudo ./setup.sh
    ```

## Usage

### Display all active ports and services

```bash
./devopsfetch.sh -p
Provide detailed information about a specific port
bash
Copy code
./devopsfetch.sh -p <port_number>
List all Docker images and containers
bash
Copy code
./devopsfetch.sh -d
Provide detailed information about a specific Docker container
bash
Copy code
./devopsfetch.sh -d <container_name>
Display all Nginx domains and their ports
bash
Copy code
./devopsfetch.sh -n
Provide detailed configuration information for a specific Nginx domain
bash
Copy code
./devopsfetch.sh -n <domain>
List all users and their last login times
bash
Copy code
./devopsfetch.sh -u
Provide detailed information about a specific user
bash
Copy code
./devopsfetch.sh -u <username>
Display activities within a specified time range
bash
Copy code
./devopsfetch.sh -t "YYYY-MM-DD HH:MM:SS" "YYYY-MM-DD HH:MM:SS"
Enable continuous monitoring and logging
bash
Copy code
./devopsfetch.sh -l
Help
To show help message:

bash
Copy code
./devopsfetch.sh -h


Logging Mechanism
Logs are stored in /var/log/devopsfetch.log. Log rotation is set up to rotate daily and keep 7 days of logs.

To view the logs:
sudo tail -f /var/log/devopsfetch.log


Systemd Service
The setup script installs a systemd service for continuous monitoring and logging. The service is enabled and started automatically.

To check the status of the service:
sudo systemctl status devopsfetch.service

To start the service:
sudo systemctl start devopsfetch.service

To stop the service:
sudo systemctl stop devopsfetch.service

To enable the service to start on boot:
sudo systemctl enable devopsfetch.service


To disable the service:
sudo systemctl disable devopsfetch.service

Contributing
Contributions are welcome! Please fork the repository and submit a pull request.
