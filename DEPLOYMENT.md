# Automatic Deployment Setup

This repository includes a GitHub Actions workflow that automatically deploys the website when changes are pushed to the master branch.

## Required GitHub Secrets

To enable automatic deployment, you need to configure the following secrets in your GitHub repository settings:

1. **HOST** - The IP address or hostname of your deployment server
2. **USERNAME** - The SSH username for connecting to your server
3. **PRIVATE_KEY** - The private SSH key for authentication (corresponding public key should be in server's ~/.ssh/authorized_keys)

## Setting up the secrets

1. Go to your GitHub repository
2. Click on Settings > Secrets and variables > Actions
3. Click "New repository secret" for each of the required secrets above

## Server Setup Requirements

Your deployment server should have:
- Docker and docker-compose installed
- The gostwyck repository cloned to the correct path
- SSH access configured with key-based authentication
- The user should have permissions to run docker commands

## Deployment Configuration

The workflow is configured to deploy to `/home/tom/gostwyck` on the server. If your repository is cloned to a different path, update line 23 in `.github/workflows/deploy.yml`.

## Manual Deployment

You can also trigger the deployment manually by going to Actions > Deploy to Production > Run workflow in your GitHub repository.