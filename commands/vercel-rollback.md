---
description: Rollback to a previous Vercel deployment
allowed-tools: Bash, Read
---

# Rollback Deployment

Rollback to a previous Vercel deployment.

## Instructions

1. **List Recent Deployments**
   - Run `vercel ls` to see deployment history
   - Show URLs, timestamps, and status

2. **Identify Target Deployment**
   - Ask user which deployment to rollback to
   - Or identify the last successful deployment

3. **Execute Rollback**
   - Use `vercel promote <deployment-url>` to promote previous deployment
   - This makes the selected deployment the current production

4. **Verify Rollback**
   - Confirm the production URL now serves the rolled-back version
   - Check that the site is functioning correctly

## Safety Notes

- Rollback does not delete the current deployment
- You can always roll forward again if needed
- Environment variables remain as configured
