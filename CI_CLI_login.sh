#!/bin/bash
#
# Written by: Michael Gupton
# mgupton@alertlogic.com/mg@bitpile.me
# Date: 2017-11-03
#
# This script logs in to Alert Logic Cloud Insight and saves the
# authentication token so it can be used with subsequent API
# calls from the same shell session.
#
# Dependencies:
#
# - curl
# - jq
#
#
# Usage:
#
# Example of listing the environments using the authentication token.
#
# source ci_cli_login.sh
#
# curl -H "x-aims-auth-token: ${auth_token}" https://api.cloudinsight.alertlogic.com/environments/v1/<cid>
#
read -p "Username: " user
read -sp "Password: " pass
echo ""
export auth_token=$(curl -s -X POST -u "${user}:${pass}" https://api.cloudinsight.alertlogic.com/aims/v1/authenticate | jq -r ". | .authentication.token")
echo "Token: "$auth_token