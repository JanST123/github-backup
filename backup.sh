#!/bin/sh

#
# Simple shell script to backup all GitHub repos
# Usage: github-backup.sh <organization>
# source: https://github.com/stongo/github-backup/blob/master/github-backup.sh
#

set -ex

AUTHENTICATION_API_TOKEN="${GITHUB_AUTH_TOKEN:?"must be set and non-empty"}:x-oauth-basic"
REPOS_API_URL="https://api.github.com/user/repos?type=owner"
DATE=$(date +"%Y%m%d")
TEMP_DIR="github_${ORG}_${DATE}"
BACKUP_FILE="${TEMP_DIR}.tgz"

# we only want one backup (TODO: REMOVE THIS LINE TO HAVE ONE BACKUP PER DAY)
rm -rf github_*.tgz

mkdir -p "$TEMP_DIR" && cd "$TEMP_DIR"
curl -u $AUTHENTICATION_API_TOKEN -s "$REPOS_API_URL" | php -f ../get_ssh_urls.php | xargs -n 1 git clone --mirror
cd -
tar zcf "$BACKUP_FILE" "$TEMP_DIR"
rm -rf "$TEMP_DIR"

