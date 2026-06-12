#!/bin/bash
set -euo pipefail

# Simple low-intensity HTTP test for a lab ALB endpoint.
# Do not use against systems you do not own or have permission to test.

if [ $# -ne 1 ]; then
  echo "Usage: $0 http://your-alb-dns-name"
  exit 1
fi

URL="$1"

for i in {1..30}; do
  echo "Request $i"
  curl -s -o /dev/null -w "%{http_code} %{time_total}\n" "$URL"
  sleep 1
done
