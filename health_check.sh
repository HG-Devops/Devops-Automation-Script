#!/bin/bash

# This script logs system performance and checks if a service is running.

# 1. Define Variables
REPORT_FILE="system_report.txt"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "------------------------------------------" | tee -a $REPORT_FILE
echo "System Health Report - $TIMESTAMP" | tee -a $REPORT_FILE
echo "------------------------------------------" | tee -a $REPORT_FILE

# 2. Check Disk Usage (Displays human-readable format)
echo "Checking Disk Usage..."
df -h | grep '^/dev/' >> $REPORT_FILE

# 3. Check Memory Usage
echo "Checking Free Memory..."
free -m >> $REPORT_FILE

# 4. Conditional Logic: Check if 'ssh' is running
# Using 'systemctl' from Day 3 concepts
if systemctl is-active --quiet ssh; then
    echo "SSH Service: RUNNING" >> $REPORT_FILE
else
    echo "SSH Service: DOWN" >> $REPORT_FILE
fi

echo "Report saved to $REPORT_FILE"
echo "Done."
