#!/usr/bin/env bash
set -euo pipefail

REMOTE_HOST="huoshan209"
REMOTE_DIR="/var/www/llmpass-homepage"
DOMAIN="https://llmpass.homepage.lockloyal.cn"

if [ ! -f "index.html" ]; then
  echo "错误：当前目录不存在 index.html"
  exit 1
fi

VERSION="$(date +%Y%m%d%H%M)"
TARGET_FILE="${VERSION}.html"

cp index.html "${TARGET_FILE}"
scp "${TARGET_FILE}" "${REMOTE_HOST}:${REMOTE_DIR}/${TARGET_FILE}"

echo "${DOMAIN}/${VERSION}"