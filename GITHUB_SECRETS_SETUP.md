# GitHub Secrets Setup Guide

## Current Status
- ✅ Created auto-deploy-workflow branch
- ✅ Added GitHub Actions workflow (.github/workflows/deploy.yml)
- ✅ Added deployment documentation (DEPLOYMENT.md)
- ✅ Committed and pushed to GitHub
- ⏳ **NEXT STEP**: Set up GitHub secrets

## Branch Information
- **Current branch**: auto-deploy-workflow
- **GitHub URL**: https://github.com/bookofthefuture/gostwyck
- **Pull Request**: https://github.com/bookofthefuture/gostwyck/pull/new/auto-deploy-workflow

## Setting up GitHub Secrets

### Step-by-Step Instructions

1. **Go to your repository on GitHub**: https://github.com/bookofthefuture/gostwyck

2. **Navigate to Settings**:
   - Click the "Settings" tab (far right in the repository menu)

3. **Go to Secrets and Variables**:
   - In the left sidebar, click "Secrets and variables"
   - Then click "Actions"

4. **Add each secret** by clicking "New repository secret":

### SECRET 1: HOST
- **Name**: `HOST`
- **Value**: Your server's IP address or hostname (e.g., `gostwyck.co.uk` or `192.168.1.100`)

### SECRET 2: USERNAME  
- **Name**: `USERNAME`
- **Value**: The SSH username on your server (likely `tom`)

### SECRET 3: PRIVATE_KEY
- **Name**: `PRIVATE_KEY`
- **Value**: Your private SSH key content (the entire contents of your `~/.ssh/id_rsa` or similar private key file)

## Getting your private key:
On your local machine, run:
```bash
cat ~/.ssh/id_rsa
```

Copy the entire output (including `-----BEGIN OPENSSH PRIVATE KEY-----` and `-----END OPENSSH PRIVATE KEY-----`) and paste it as the PRIVATE_KEY secret value.

## Important Notes:
- Make sure the corresponding public key is in your server's `~/.ssh/authorized_keys`
- The username should have permission to run `docker-compose` commands
- Test SSH access manually first: `ssh username@hostname`

## After Setting Up Secrets:
1. Create pull request from auto-deploy-workflow branch
2. Merge to master
3. Automatic deployment will trigger on every push to master

## Workflow Details:
- **File**: `.github/workflows/deploy.yml`
- **Deployment path**: `/home/tom/gostwyck`
- **Triggers**: Push to master branch + manual dispatch
- **Actions**: Pull code, rebuild Docker containers via docker-compose