#!/usr/bin/env bash
set -eo pipefail

ENVIRONMENTS="dev stage prod"

for ENVIRONMENT in $ENVIRONMENTS; do
  conjur policy load --as-group security_admin --namespace $ENVIRONMENT policy/puppet.yml
done

echo -e '\n\nGenerating host factory tokens...'

for ENVIRONMENT in $ENVIRONMENTS; do
  echo "$ENVIRONMENT: `conjur hostfactory token create --duration-days 30 $ENVIRONMENT/puppet | jq -r '.[].token'`"
done
