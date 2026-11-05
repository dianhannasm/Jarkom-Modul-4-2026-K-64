#!/usr/bin/env bash
# Script ini MENCETAK perintah Cisco IOS, bukan mengonfigurasi router secara otomatis.
set -euo pipefail
cat <<'CISCO_IOS'
enable
configure terminal
hostname Phantoma

interface FastEthernet0/0
ip address 192.243.0.82 255.255.255.252
no shutdown
exit

interface FastEthernet0/1
ip address 192.243.0.85 255.255.255.252
no shutdown
exit

interface FastEthernet1/0
ip address 192.243.0.1 255.255.255.224
no shutdown
exit

end
write memory
CISCO_IOS
