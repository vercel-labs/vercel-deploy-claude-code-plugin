#!/bin/bash
# Verify a Vercel deployment is healthy

DEPLOYMENT_URL=$1

if [ -z "$DEPLOYMENT_URL" ]; then
    echo "Usage: verify-deployment.sh <deployment-url>"
    exit 1
fi

echo "Verifying deployment: $DEPLOYMENT_URL"

# Check HTTP response
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$DEPLOYMENT_URL")

if [ "$HTTP_STATUS" -eq 200 ]; then
    echo "SUCCESS: Site returns HTTP 200"
elif [ "$HTTP_STATUS" -eq 301 ] || [ "$HTTP_STATUS" -eq 302 ]; then
    echo "INFO: Site returns redirect ($HTTP_STATUS)"
elif [ "$HTTP_STATUS" -eq 404 ]; then
    echo "ERROR: Site returns 404 Not Found"
    exit 1
elif [ "$HTTP_STATUS" -eq 500 ]; then
    echo "ERROR: Site returns 500 Internal Server Error"
    exit 1
else
    echo "WARNING: Site returns HTTP $HTTP_STATUS"
fi

# Check response time
RESPONSE_TIME=$(curl -s -o /dev/null -w "%{time_total}" "$DEPLOYMENT_URL")
echo "Response time: ${RESPONSE_TIME}s"

if (( $(echo "$RESPONSE_TIME > 5" | bc -l) )); then
    echo "WARNING: Response time is slow (>5s)"
fi

echo "Deployment verification complete"
