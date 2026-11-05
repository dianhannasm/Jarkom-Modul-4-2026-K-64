#!/usr/bin/env bash
# Script ini MENCETAK perintah Cisco IOS, bukan mengonfigurasi router secara otomatis.
set -euo pipefail
cat <<'CISCO_IOS'
enable
configure terminal
hostname Navi

interface FastEthernet0/0
ip address 192.243.0.62 255.255.255.252
no shutdown
exit

interface FastEthernet0/1
ip address 192.243.28.1 255.255.255.0
no shutdown
exit

interface FastEthernet1/0
ip address 192.243.31.65 255.255.255.192
no shutdown
exit

interface FastEthernet1/1
ip address 192.243.29.1 255.255.255.0
no shutdown
exit

end
write memory
CISCO_IOS
