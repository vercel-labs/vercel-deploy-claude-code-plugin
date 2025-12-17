---
name: deploy-verify
description: Deploy to Vercel and monitor logs in real-time for verification. Use this skill when the user requests deployment with testing/verification, such as "Deploy and test", "Deploy and verify", "Deploy and watch for errors", or "Deploy and help me fix any issues". Handles deployment, log monitoring, error detection, and provides context-aware fixes.
allowed-tools: Bash, Read, Write, Grep, Glob, WebFetch
---

# Deploy and Verify

Deploy to Vercel with real-time monitoring and error detection.

## Overview

This skill combines deployment with active monitoring to catch and help fix issues immediately.

## Pre-Deployment Verification

### 1. Environment Check
```bash
# Check Vercel CLI
vercel --version

# Check authentication
vercel whoami
```

### 2. Project Health Check
- Verify `package.json` exists and is valid
- Check for TypeScript errors if applicable: `npx tsc --noEmit`
- Run linting if configured: `npm run lint`
- Check for build errors locally: `npm run build`

### 3. Configuration Review
- Review `vercel.json` for correct settings
- Check environment variables are configured
- Verify build and output settings match the framework

## Deployment with Monitoring

### Step 1: Deploy
```bash
vercel --prod 2>&1
```

Capture the deployment URL from the output.

### Step 2: Monitor Build Logs
After deployment starts, monitor the build process:
```bash
vercel logs <deployment-url> --follow
```

Or check recent logs:
```bash
vercel logs <deployment-url>
```

### Step 3: Verify Deployment Health

#### Check HTTP Response
Use the deployment URL to verify the site is responding:
```bash
curl -I <deployment-url>
```

Look for:
- HTTP 200 status code
- Correct content-type headers
- No redirect loops

#### Check Function Logs (if using serverless functions)
```bash
vercel logs <deployment-url> --output json
```

## Error Detection and Resolution

### Common Build Errors

#### 1. Missing Dependencies
**Error**: `Module not found: Can't resolve 'package-name'`
**Fix**:
```bash
npm install package-name
```

#### 2. TypeScript Errors
**Error**: Type errors in the build output
**Fix**: Review the specific file and line mentioned, fix type issues

#### 3. Build Command Failure
**Error**: `Command "npm run build" exited with 1`
**Fix**: Run build locally to see full error, check `package.json` scripts

#### 4. Output Directory Not Found
**Error**: `Output directory not found`
**Fix**: Update `vercel.json` with correct `outputDirectory` or framework preset

#### 5. Environment Variable Missing
**Error**: References undefined environment variable
**Fix**:
```bash
vercel env add VARIABLE_NAME production
```

### Runtime Errors

#### 1. 500 Internal Server Error
- Check serverless function logs
- Look for unhandled exceptions
- Verify API routes are correct

#### 2. 404 Not Found
- Check routing configuration
- Verify `rewrites` in `vercel.json`
- Check for case-sensitivity issues in paths

#### 3. Edge Function Errors
- Check Edge runtime compatibility
- Verify no Node.js-specific APIs in Edge functions

## Post-Deployment Verification Checklist

1. **Site Loads**: Main page returns 200
2. **Assets Load**: CSS, JS, images load correctly
3. **API Routes**: Test critical API endpoints
4. **Environment**: Verify environment-specific config is correct
5. **Performance**: Check for obvious performance issues

## Rollback if Needed

If deployment has critical issues:
```bash
# List recent deployments
vercel ls

# Promote previous deployment to production
vercel promote <previous-deployment-url>
```

## Examples

User: "Deploy and verify everything works"
Action:
1. Run pre-deployment checks
2. Deploy with `vercel --prod`
3. Monitor logs for errors
4. Verify HTTP response
5. Report status and any issues found

User: "Deploy and watch for errors"
Action:
1. Deploy with `vercel --prod`
2. Follow logs with `vercel logs --follow`
3. Alert on any errors detected
4. Provide fix suggestions

User: "Deploy and help me fix any issues"
Action:
1. Deploy with `vercel --prod`
2. Monitor for failures
3. If errors found, analyze and suggest specific fixes
4. Guide through resolution

## Success Criteria

Deployment is verified when:
- Build completes without errors
- Site responds with HTTP 200
- No errors in runtime logs
- Critical functionality works
