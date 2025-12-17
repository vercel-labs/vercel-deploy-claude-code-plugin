---
description: Create a Vercel preview deployment for testing
allowed-tools: Bash, Read, Grep
---

# Create Preview Deployment

Create a preview deployment on Vercel for testing before going to production.

## Instructions

1. **Verify Setup**
   - Check Vercel CLI is installed
   - Verify authentication

2. **Deploy Preview**
   - Run `vercel` (without --prod flag)
   - This creates a unique preview URL

3. **Report Results**
   - Show the preview URL
   - Explain this is not the production deployment
   - Note that preview deployments are great for:
     - Testing changes before production
     - Sharing with stakeholders for review
     - Running integration tests

## Notes

- Preview deployments use preview environment variables
- Each push creates a new unique URL
- Preview URLs are publicly accessible unless configured otherwise
