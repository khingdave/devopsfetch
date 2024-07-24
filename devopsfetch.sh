#!/bin/bash

CONFIG_FILE="./config/devopsfetch.conf"

# Load configuration
function load_config() {
    if [ -f "$CONFIG_FILE" ]; then
        source "$CONFIG_FILE"
    else
        echo "Config file not found, using defaults"
        LOGFILE="/var/log/devopsfetch.log"
        MONITOR_INTERVAL=60
    fi
}

load_config

function log() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") - $1" >> $LOGFILE
}

function get_active_ports() {
    echo "Active Ports and Services:"
    ss -tuln | awk 'NR==1; NR > 1 {print | "sort -k4"}' | column -t
}

function get_port_info() {
    local port=$1
    echo "Details for Port $port:"
    ss -tuln | grep ":$port" | column -t
}

function get_docker_images() {
    echo "Docker Images:"
    docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.ImageID}}\t{{.Size}}"
}

function get_docker_containers() {
    echo "Docker Containers:"
    docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
}

function get_container_info() {
    local container=$1
    echo "Details for Container $container:"
    docker inspect "$container" | jq '.[] | {Name: .Name, State: .State, Config: .Config}' | moreutils columns
}

function get_nginx_domains() {
    echo "Nginx Domains and Ports:"
    nginx -T 2>/dev/null | grep -E 'server_name|listen' | tr -d ';' | awk '/server_name/ {sn=$0} /listen/ {print sn, $0}' | column -t
}

function get_nginx_config() {
    local domain=$1
    echo "Nginx Configuration for Domain $domain:"
    nginx -T 2>/dev/null | awk -v domain="$domain" '$0 ~ domain {found=1} found {print} /}/ {found=0}' | column -t
}

function get_users() {
    echo "Users and Last Login Times:"
    lastlog | tail -n +2 | awk '{print $1, $4, $5, $6, $7}' | column -t
}

function get_user_info() {
    local username=$1
    echo "Last Logins for User $username:"
    last "$username" | head -n 10 | column -t
}

function get_time_range_activities() {
    local start_time=$1
    local end_time=$2
    echo "Activities from $start_time to $end_time:"
    last | awk -v start="$start_time" -v end="$end_time" '{if ($4" "$5" "$6 >= start && $4" "$5" "$6 <= end) print $0}' | column -t
}

function show_help() {
    echo "Usage: devopsfetch.sh [options]"
    echo "Options:"
    echo "  -p, --port [PORT]        Display active ports or details for a specific port"
    echo "  -d, --docker [CONTAINER] Display Docker images and containers or details for a specific container"
    echo "  -n, --nginx [DOMAIN]     Display Nginx domains and ports or configuration for a specific domain"
    echo "  -u, --users [USERNAME]   List users and their last login times or details for a specific user"
    echo "  -t, --time START END     Display activities within a specified time range"
    echo "  -l, --log                Enable continuous monitoring and logging"
    echo "  -h, --help               Show this help message"
}

function monitor_and_log() {
    while true; do
        log "$(get_active_ports)"
        log "$(get_docker_images)"
        log "$(get_docker_containers)"
        log "$(get_nginx_domains)"
        log "$(get_users)"
        sleep "$MONITOR_INTERVAL"
    done
}

case $1 in
    -p|--port)
        if [ -z "$2" ]; then
            get_active_ports
        else
            get_port_info "$2"
        fi
        ;;
    -d|--docker)
        if [ -z "$2" ]; then
            get_docker_images
            get_docker_containers
        else
            get_container_info "$2"
        fi
        ;;
    -n|--nginx)
        if [ -z "$2" ]; then
            get_nginx_domains
        else
            get_nginx_config "$2"
        fi
        ;;
    -u|--users)
        if [ -z "$2" ]; then
            get_users
        else
            get_user_info "$2"
        fi
        ;;
    -t|--time)
        get_time_range_activities "$2" "$3"
        ;;
    -l|--log)
        monitor_and_log
        ;;
    -h|--help)
        show_help
        ;;
    *)
        echo "Invalid option: $1"
        show_help
        ;;
esac

