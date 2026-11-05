#!/usr/bin/env bash
# Script ini MENCETAK perintah Cisco IOS, bukan mengonfigurasi router secara otomatis.
set -euo pipefail
cat <<'CISCO_IOS'
enable
configure terminal
hostname Deus

interface FastEthernet0/0
ip address 192.243.0.70 255.255.255.252
no shutdown
exit

interface FastEthernet0/1
ip address 192.243.30.129 255.255.255.128
no shutdown
exit

interface FastEthernet1/0
ip address 192.243.0.73 255.255.255.252
no shutdown
exit

end
write memory
CISCO_IOS
