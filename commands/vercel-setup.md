---
description: Set up Vercel CLI and configure the project for deployment
allowed-tools: Bash, Read, Write
---

# Vercel Setup

Guide through setting up Vercel for the current project.

## Instructions

1. **Check Vercel CLI**
   - Run `vercel --version`
   - If not installed, provide installation command: `npm install -g vercel`

2. **Authentication**
   - Run `vercel whoami` to check login status
   - If not logged in, run `vercel login`

3. **Project Linking**
   - Check if project is already linked to Vercel
   - If not, run `vercel link` to connect to existing project or create new one

4. **Configuration Review**
   - Check for `vercel.json`
   - Review build settings
   - Identify environment variables needed

5. **Environment Variables**
   - List current env vars: `vercel env ls`
   - Guide through adding required variables

## Output

Provide summary of:
- CLI version installed
- Logged in account
- Linked project name
- Configuration status
- Any missing setup items
