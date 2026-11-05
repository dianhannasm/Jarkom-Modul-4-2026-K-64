#!/usr/bin/env bash
# Script ini MENCETAK perintah Cisco IOS, bukan mengonfigurasi router secara otomatis.
set -euo pipefail
cat <<'CISCO_IOS'
enable
configure terminal
hostname Cyberia

interface FastEthernet0/0
ip address 192.243.30.1 255.255.255.128
no shutdown
exit

interface FastEthernet0/1
no shutdown
exit

interface FastEthernet1/0
ip address 192.243.0.57 255.255.255.252
no shutdown
exit

end
write memory
CISCO_IOS
