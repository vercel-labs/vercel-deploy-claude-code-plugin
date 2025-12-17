---
description: Deploy the current project to Vercel
allowed-tools: Bash, Read, Write, Grep, Glob
---

# Deploy to Vercel

Deploy the current project to Vercel and return the deployment URL.

## Instructions

1. **Check Prerequisites**
   - Verify Vercel CLI is installed (`vercel --version`)
   - Check authentication status (`vercel whoami`)
   - If not set up, guide through `vercel login`

2. **Review Configuration**
   - Check for `vercel.json` configuration
   - Identify framework type
   - Note any special build settings

3. **Execute Deployment**
   - Run `vercel --prod` for production deployment
   - Capture and display the deployment URL
   - Show build status and duration

4. **Post-Deployment**
   - Display the live URL prominently
   - Provide link to Vercel dashboard
   - Mention how to check logs if needed

## Output Format

After deployment, provide:
- The deployment URL (clickable)
- Deployment status (success/failure)
- Any warnings or notes from the build
