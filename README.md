# TerraShark Website

Landing page for [TerraShark](https://github.com/LukasNiessen/terrashark) — the #1 Terraform & OpenTofu skill for AI coding assistants.

Built with [Astro](https://astro.build).

## Development

```bash
npm install
npm run dev       # localhost:4321
npm run build     # static output in dist/
npm run preview   # preview the build
```

## Deployment

Merging to `main` triggers a GitHub Actions workflow that:

1. Builds the site
2. Syncs to an S3 bucket
3. Invalidates the CloudFront cache

Required GitHub configuration:

| Type | Name | Description |
|------|------|-------------|
| Secret | `AWS_ROLE_ARN` | IAM role ARN for OIDC authentication |
| Variable | `AWS_REGION` | e.g. `us-east-1` |
| Variable | `S3_BUCKET_NAME` | S3 bucket configured for static hosting |
| Variable | `CLOUDFRONT_DISTRIBUTION_ID` | CloudFront distribution ID |
