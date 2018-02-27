#!/bin/sh
# encrypt.sh
#
# -----------------------------------------------------------------------------
# Purpose: encrypt ツール
# -----------------------------------------------------------------------------
#
# Descritpion:
#   ./crypt_dirに格納されている.enc以外のファイルを*.encとして暗号化する
#
# Usage:
#   $ encrypt.sh param
#     param - encrypt key
#
# -----------------------------------------------------------------------------
set -Ceu
crypt_dir=./crypt_dir
key=$1
if [ ${#key} -lt 8 ]; then
    echo "鍵は8文字以上を指定してください"
    exit 1
fi
for file in $(find ./crypt_dir -type f -not -name "*.enc" -not -name ".*" ); do
    outfile=${file}.enc
    echo "[$file] encrypt to [${outfile}]"
    openssl aes-256-cbc -e -k ${key} -in ${file} -out ${outfile}
done
