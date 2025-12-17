---
name: vercel-deploy
description: Deploy applications and websites to Vercel. Use this skill when the user requests deployment actions such as "Deploy my app", "Deploy this to production", "Create a preview deployment", "Deploy and give me the link", or "Push this live". Handles authentication setup, configuration, and returns deployment URLs.
allowed-tools: Bash, Read, Write, Grep, Glob
---

# Vercel Deploy

Deploy applications and websites to Vercel hosting platform.

## Pre-Deployment Checks

Before deploying, verify the following:

### 1. Check Vercel CLI Installation
```bash
vercel --version
```

If not installed, guide the user to install it:
```bash
npm install -g vercel
```

### 2. Check Authentication
```bash
vercel whoami
```

If not authenticated, run:
```bash
vercel login
```

### 3. Review Project Configuration
- Check for existing `vercel.json` configuration
- Review `.vercelignore` for excluded files
- Identify framework (Next.js, React, Vue, etc.)

## Deployment Process

### Preview Deployment (Default)
```bash
vercel
```

This creates a preview deployment with a unique URL for testing.

### Production Deployment
```bash
vercel --prod
```

This deploys to the production domain.

### Deployment with Environment Variables
If the project requires environment variables:
1. Check for `.env.local` or `.env.production` files
2. Remind user to set up environment variables in Vercel dashboard or via CLI:
```bash
vercel env add VARIABLE_NAME
```

## Post-Deployment

After successful deployment:
1. Display the deployment URL prominently
2. Show the deployment status
3. Provide the Vercel dashboard link for the project
4. Mention how to check deployment logs if needed

## Common Deployment Scenarios

### First-Time Deployment
- Will prompt for project setup
- Link to existing Vercel project or create new one
- Configure project settings (build command, output directory)

### Existing Project
- Deploys using existing configuration
- Respects `vercel.json` settings

### Monorepo Deployment
Use the `--cwd` flag to specify subdirectory:
```bash
vercel --cwd ./packages/web
```

## Error Handling

If deployment fails:
1. Check the error message from Vercel
2. Common issues:
   - Build command errors
   - Missing dependencies
   - Environment variable issues
   - Output directory misconfiguration
3. Suggest specific fixes based on the error

## Framework Detection

Vercel auto-detects frameworks. Common ones include:
- Next.js
- React (Create React App)
- Vue.js
- Nuxt.js
- Svelte/SvelteKit
- Astro
- Remix
- Static HTML

## Examples

User: "Deploy my app"
Action: Run `vercel` for preview deployment, show URL

User: "Deploy this to production"
Action: Run `vercel --prod`, show production URL

User: "Create a preview deployment"
Action: Run `vercel`, show preview URL

User: "Push this live"
Action: Run `vercel --prod`, show production URL
