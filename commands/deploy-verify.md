---
description: Deploy to Vercel and verify the deployment with log monitoring
allowed-tools: Bash, Read, Write, Grep, Glob, WebFetch
---

# Deploy and Verify

Deploy to Vercel with active monitoring and verification.

## Instructions

1. **Pre-Deployment Checks**
   - Verify CLI and authentication
   - Run local build check if applicable
   - Review configuration

2. **Deploy**
   - Execute `vercel --prod`
   - Capture deployment URL

3. **Monitor and Verify**
   - Check deployment logs for errors
   - Verify HTTP response (200 OK)
   - Test that the site loads correctly

4. **Report Issues**
   - If errors found, analyze and suggest fixes
   - If deployment healthy, confirm success
   - Provide rollback instructions if needed

## Error Handling

If deployment fails or has issues:
- Show the specific error from logs
- Provide context-aware fix suggestions
- Offer to help resolve the issue
