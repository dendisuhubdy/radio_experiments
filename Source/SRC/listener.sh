#!/bin/bash
echo "waiting pubkey received.."
amodem recv -o pubkey_partner.pem
echo ""
echo "pubkey partner has been received.."
echo ""
echo "send host pubkey to partner.."
sleep 3
amodem send -i pubkey.pem
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