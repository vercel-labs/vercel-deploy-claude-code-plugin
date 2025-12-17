---
description: View deployment logs from Vercel
allowed-tools: Bash, Read, Grep
---

# View Vercel Logs

Fetch and analyze deployment logs from Vercel.

## Instructions

1. **Get Recent Deployments**
   - Run `vercel ls` to list recent deployments
   - Identify the deployment to check

2. **Fetch Logs**
   - For build logs: `vercel logs <deployment-url>`
   - For real-time logs: `vercel logs <deployment-url> --follow`

3. **Analyze Logs**
   - Look for errors or warnings
   - Identify any failed requests
   - Check for performance issues

4. **Report Findings**
   - Summarize any issues found
   - Provide context for errors
   - Suggest fixes if applicable

## Options

- Use `--follow` to stream logs in real-time
- Use `--output json` for structured output
- Filter by time range if needed
