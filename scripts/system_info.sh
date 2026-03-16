#!/bin/bash


echo "===================GUARDPOST SYSTEM REPORT================"
echo "Date: $(date)"
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime -p)"
echo "Logged in users: $(who)"
echo "Disk usage:"
df -h
echo "Memory usage"
free -h
echo "========================="
