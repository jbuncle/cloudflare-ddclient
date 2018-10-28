#! /bin/bash
set -e

# Check for required variables
test -n "$CLOUDFLARE_EMAIL" || (echo "Missing CLOUDFLARE_EMAIL variable" && exit 1)
test -n "$CLOUDFLARE_KEY" || (echo "Missing CLOUDFLARE_KEY variable" && exit 1)
test -n "$CLOUDFLARE_DOMAIN" || (echo "Missing CLOUDFLARE_DOMAIN variable" && exit 1)
test -n "$HOSTNAME" || (echo "Missing HOSTNAME variable" && exit 1)

# Populate 'template' config file
sed -i "s/cloudflare-email/$CLOUDFLARE_EMAIL/g" /etc/ddclient/ddclient.conf
sed -i "s/cloudflare-global-api-key/$CLOUDFLARE_KEY/g" /etc/ddclient/ddclient.conf
sed -i "s/cloudflare-domain/$CLOUDFLARE_DOMAIN/g" /etc/ddclient/ddclient.conf
sed -i "s/full-hostname/$HOSTNAME/g" /etc/ddclient/ddclient.conf

# Run 'CMD'
exec "$@"