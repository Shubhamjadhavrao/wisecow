#!/bin/bash

# Threshold values
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

echo "===== System Health Report ====="

# CPU Usage
CPU_USAGE=$(top -bn1 | grep "Cpu" | awk '{print $2}')

echo "CPU Usage: $CPU_USAGE%"

CPU_INT=${CPU_USAGE%.*}

if [ "$CPU_INT" -gt "$CPU_THRESHOLD" ]; then
    echo "ALERT: CPU usage is above 80%"
fi

# Memory Usage
MEM_USAGE=$(free | grep Mem | awk '{print ($3/$2) * 100.0}')

echo "Memory Usage: $MEM_USAGE%"

MEM_INT=${MEM_USAGE%.*}

if [ "$MEM_INT" -gt "$MEM_THRESHOLD" ]; then
    echo "ALERT: Memory usage is above 80%"
fi

# Disk Usage
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Disk Usage: $DISK_USAGE%"

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    echo "ALERT: Disk usage is above 80%"
fi

# Running Processes
PROCESS_COUNT=$(ps -ef | wc -l)

echo "Running Processes: $PROCESS_COUNT"

echo "===== Monitoring Completed ====="
