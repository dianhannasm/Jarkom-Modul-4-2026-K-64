#!/usr/bin/env bash
# Script ini MENCETAK perintah Cisco IOS, bukan mengonfigurasi router secara otomatis.
set -euo pipefail
cat <<'CISCO_IOS'
enable
configure terminal
hostname Psyche

interface FastEthernet0/0
ip address 192.243.0.34 255.255.255.248
no shutdown
exit

interface FastEthernet0/1
ip address 192.243.16.1 255.255.252.0
no shutdown
exit

end
write memory
CISCO_IOS
