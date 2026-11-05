#!/usr/bin/env bash
# Script ini MENCETAK perintah Cisco IOS, bukan mengonfigurasi router secara otomatis.
set -euo pipefail
cat <<'CISCO_IOS'
enable
configure terminal
router ospf 1
network 192.243.0.0 0.0.31.255 area 0
passive-interface FastEthernet0/1
passive-interface FastEthernet1/0
passive-interface FastEthernet1/1
end
write memory
CISCO_IOS
