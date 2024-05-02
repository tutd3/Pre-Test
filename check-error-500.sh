#!/bin/bash
# created by tutde suputrawan

log_file="./logs"
current_time=$(date "+%s")
threshold_seconds=600

# Calculate the start time for the 10-minute window
start_time=$((current_time - threshold_seconds))


# Iterate through log files in the directory
for logfile in "${log_file}"/*.log; do
    # Count occurrences of HTTP 500 errors in the last 1 minute of the current log file
    error_count=$(awk -v start_time="$start_time" '$4 >= start_time && $9 == "500" {count++} END {print count}' "$logfile")

    log=$(echo ${logfile} | sed 's|^./logs/||')
    echo "There were     ${error_count} HTTP 500 errors in ${log} in the last 10 minute."
done
