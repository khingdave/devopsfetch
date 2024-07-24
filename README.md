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

Provide detailed information about a specific port
```bash
./devopsfetch.sh -p

List all Docker images and containers
```bash
./devopsfetch.sh -d

Provide detailed information about a specific Docker container
```bash
./devopsfetch.sh -d <container_name>

Display all Nginx domains and their ports
```bash
./devopsfetch.sh -n

Provide detailed configuration information for a specific Nginx domain
```bash
./devopsfetch.sh -n <domain>

List all users and their last login times
```bash
./devopsfetch.sh -u

Provide detailed information about a specific user
```bash
./devopsfetch.sh -u <username>

Display activities within a specified time range
```bash
./devopsfetch.sh -t "YYYY-MM-DD HH:MM:SS" "YYYY-MM-DD HH:MM:SS"

Enable continuous monitoring and logging
```bash
./devopsfetch.sh -l

Help
To show help message:
```bash
./devopsfetch.sh -h

Logging Mechanism
Logs are stored in /var/log/devopsfetch.log. Log rotation is set up to rotate daily and keep 7 days of logs.

To view the logs:
```bash
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
