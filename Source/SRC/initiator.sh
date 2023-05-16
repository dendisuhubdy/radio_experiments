#!/bin/bash
echo "sending pubkey to listener"
sleep 1
amodem send -i pubkey.pem
echo "waiting pubkey partner received.."
echo ""
amodem recv -o pubkey_partner.pem
echo "pubkey partner hAas been received.."
echo ""
sleep 1
clear
echo ""
echo "generate secret session key.."
echo "-----------------------------"
openssl pkeyutl -derive -inkey privkey.pem -peerkey pubkey_partner.pem -out secret.bin
echo $(cat secret.bin | base64)
echo ""
echo "Establish.. (press enter to start chat app)"

