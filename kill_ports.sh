#!/bin/bash

# Ports to check and kill
PORTS=(8080 3030 4200)

for port in "${PORTS[@]}"; do
  echo "Checking port $port..."
  
  PID=$(lsof -ti tcp:$port)
  
  if [ -n "$PID" ]; then
    echo "Killing process on port $port with PID: $PID"
    kill -9 $PID
  else
    echo "No process found on port $port."
  fi
done