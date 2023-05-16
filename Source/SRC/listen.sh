#!/bin/bash
rm chat.txt
echo "" > chat.txt
while true
do
amodem recv -o cipher.enc.txt
base64 -d cipher.enc.txt > cipher.enc
openssl enc -pbkdf2 -in cipher.enc -out decrypted.txt -d -aes256 -k secret.bin
cat decrypted.txt >> chat.txt
rm cipher* decrypt*
done
