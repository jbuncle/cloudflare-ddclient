# Cloudflare DDClient Docker Image

Docker Image to update a Cloudflare account with Dynamic IP changes. Uses ddclient to look for IP changes and update a remote Cloudflare account.

See https://support.cloudflare.com/hc/en-us/articles/360020524512-Manage-dynamic-IPs-in-Cloudflare-DNS-programmatically

## Environment Variables

- CLOUDFLARE_EMAIL
- CLOUDFLARE_KEY
- CLOUDFLARE_DOMAIN
- HOSTNAME
