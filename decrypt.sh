#!/bin/sh
# encrypt.sh
#
# -----------------------------------------------------------------------------
# Purpose: decrypt ツール
# -----------------------------------------------------------------------------
#
# Descritpion:
#   ./crypt_dirに格納されている*.encを*.decとして複合化する
#
# Usage:
#   $ decrypt.sh param
#     param - decrypt key
#
# -----------------------------------------------------------------------------
set -Ceu
crypt_dir=./crypt_dir
key=$1
if [ ${#key} -lt 8 ]; then
    echo "鍵は8文字以上を指定してください"
    exit 1
fi
for file in $(find ${crypt_dir} -name "*.enc"); do
    outfile=${file%.*}.dec
    echo "[$file] decrypt to [${outfile}]"
    openssl aes-256-cbc -d -k ${key} -in ${file} -out ${outfile}
done
