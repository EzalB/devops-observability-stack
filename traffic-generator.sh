#!/bin/bash

HOST="http://localhost:8080"
echo "Starting load test against $HOST..."

# Send 100 requests to root (200s)
for i in {1..100}; do curl -s $HOST/ > /dev/null; done

# Send 20 requests to error (500s)
for i in {1..20}; do curl -s $HOST/error > /dev/null; done

echo "Batch sent: 100 OK + 20 Error"
sleep 2