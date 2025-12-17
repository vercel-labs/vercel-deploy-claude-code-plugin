#!/bin/bash
# Check Vercel CLI setup and authentication status

echo "Checking Vercel setup..."

# Check if Vercel CLI is installed
if ! command -v vercel &> /dev/null; then
    echo "ERROR: Vercel CLI is not installed"
    echo "Install with: npm install -g vercel"
    exit 1
fi

echo "Vercel CLI version: $(vercel --version)"

# Check authentication
AUTH_STATUS=$(vercel whoami 2>&1)
if [[ $AUTH_STATUS == *"not logged in"* ]] || [[ $AUTH_STATUS == *"Error"* ]]; then
    echo "WARNING: Not logged in to Vercel"
    echo "Run: vercel login"
    exit 1
fi

echo "Logged in as: $AUTH_STATUS"

# Check if project is linked
if [ -f ".vercel/project.json" ]; then
    PROJECT_ID=$(cat .vercel/project.json | grep -o '"projectId":"[^"]*"' | cut -d'"' -f4)
    echo "Project linked: $PROJECT_ID"
else
    echo "INFO: Project not linked to Vercel yet"
    echo "Run: vercel link"
fi

echo "Vercel setup check complete"
