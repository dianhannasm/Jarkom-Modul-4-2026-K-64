# Jarkom-Modul-4-2026-K-64

| Nama | NRP |
|---|---|
| Dian Hanna Simanjuntak | 5027251116 |
| Mahrinza Redouane Zakariyah | 5027251074 |


## Reporting

### Cisco Packet Tracer - Perancangan Topologi dan Pengalamatan CIDR  
<!-- Gambar topologi: tambahkan path gambar asli dari repo apabila sudah tersedia. -->
Pada bagian Cisco Packet Tracer (CPT), dilakukan pembangunan topologi, pembagian alamat IP menggunakan CIDR, serta konfigurasi routing untuk menghubungkan seluruh subnet internal. Topologi menggunakan **13 router**, **13 switch**, dan **25 perangkat akhir**. Alokasi kelompok K-64 menggunakan blok induk `192.243.0.0/19`, dengan kebutuhan alamat pada tabel sebesar **2.814 IP**. Bagian ini khusus membahas CPT–CIDR; implementasi GNS3/VLSM dikerjakan dan dilaporkan terpisah.  

### Pembagian Alamat IP

Kebutuhan alamat tiap segmen dicatat pada sheet **Rute**, kemudian dipilih prefix sesuai kapasitas subnet. Network ID, netmask, broadcast, serta rentang alamat host dihitung dan dicatat pada sheet **Pembagian IP - CIDR**. Pembagian tersebut menghasilkan 25 subnet A1–A25.  

![Tabel Rute dan kebutuhan subnet](IP-tree-and-subnetting/Subnet-CIDR.png)  

| Subnet | Jumlah IP | Network ID / Prefix | Keterangan |
|---|---:|---|---|
| A1 | 126 | `192.243.30.0/25` | Cyberia → Switch1 → JJ, MyuMyu |
| A2 | 2 | `192.243.0.56/30` | Cyberia → Wired |
| A3 | 881 | `192.243.16.0/22` | Psyche → Switch3 → Karl, Lin |
| A4 | 514 | `192.243.20.0/22` | Accela → Switch5 → Omnipresence, Denpa |
| A5 | 301 | `192.243.24.0/23` | Copland → Switch4 → Masayuki |
| A6 | 267 | `192.243.26.0/23` | Tachibana → Switch9 → Collective, Ghost |
| A7 | 254 | `192.243.28.0/24` | Navi → Switch6 → Alice, Reika |
| A8 | 143 | `192.243.29.0/24` | Navi → Switch8 → Yasuo, Miho, Kuma |
| A9 | 99 | `192.243.30.128/25` | Deus → Switch10 → Lilith, Specter |
| A10 | 62 | `192.243.31.0/26` | Shibuya → Switch13 → Lain, Mika |
| A11 | 58 | `192.243.31.64/26` | Navi → Switch7 → Taro |
| A12 | 33 | `192.243.31.128/26` | Protocol7 → Switch11 → Chisa, Hodgeson |
| A13 | 32 | `192.243.31.192/26` | Copland → Juri |
| A14 | 15 | `192.243.0.0/27` | Phantoma → Switch12 → Semi |
| A15 | 4 | `192.243.0.32/29` | Wired → Switch2 → Psyche, Copland, Schumann |
| A16 | 4 | `192.243.0.40/29` | Schumann → Akashic |
| A17 | 3 | `192.243.0.48/29` | Knights → Eiri |
| A18 | 2 | `192.243.0.60/30` | Wired → Navi |
| A19 | 2 | `192.243.0.64/30` | Wired → Tachibana |
| A20 | 2 | `192.243.0.68/30` | Tachibana → Deus |
| A21 | 2 | `192.243.0.72/30` | Deus → Protocol7 |
| A22 | 2 | `192.243.0.76/30` | Protocol7 → Knights |
| A23 | 2 | `192.243.0.80/30` | Knights → Phantoma |
| A24 | 2 | `192.243.0.84/30` | Phantoma → Shibuya |
| A25 | 2 | `192.243.0.88/30` | Schumann → Accela |

Total kebutuhan adalah **2.814 IP**, sedangkan kapasitas 25 subnet yang dialokasikan adalah **4.188 alamat IPv4** (termasuk Network ID dan broadcast). Blok induk `/19` memiliki kapasitas **8.192 alamat**. Prefix `/22` dan `/23` digunakan untuk segmen dengan kebutuhan besar, sedangkan koneksi point-to-point antarrouter menggunakan `/30`.  

Sebagai contoh, pembagian **A1** dan **A2**:  

| Subnet | Network ID | Netmask | Broadcast | Range IP Host |
|---|---|---|---|---|
| A1 | `192.243.30.0` | `255.255.255.128` | `192.243.30.127` | `192.243.30.1 - 192.243.30.126` |
| A2 | `192.243.0.56` | `255.255.255.252` | `192.243.0.59` | `192.243.0.57 - 192.243.0.58` |

### Penggabungan CIDR dan Pohon Pembagian IP

Subnet yang memiliki ukuran sama, bersebelahan, dan sejajar terhadap batas blok digabungkan bertahap dalam sheet **Penggabungan - CIDR**. Tahap awal menggunakan B1–B12 dan tahap berikutnya C1–C13.  

<!-- Gambar tabel Penggabungan CIDR: belum ada nama file yang terlihat di daftar repo. -->
Beberapa contoh penggabungan yang digunakan:  

| Subnet gabungan | Subnet asal | Prefix akhir | Network ID hasil |
|---|---|---|---|
| `B1` | `A3 + A4` | `/21` | `192.243.16.0/21` |
| `B2` | `A5 + A6` | `/22` | `192.243.24.0/22` |
| `B3` | `A7 + A8` | `/23` | `192.243.28.0/23` |
| `B4` | `A1 + A9` | `/24` | `192.243.30.0/24` |
| `C5` | `B1 + C4` | `/20` | `192.243.16.0/20` |
| `C13` | `C8 + C12` | `/25` | `192.243.0.0/25` |

Untuk menyelaraskan blok kecil digunakan **R1 = 192.243.0.92/30** (4 alamat cadangan) dan **R2 = 192.243.0.96/27** (32 alamat cadangan). Keduanya hanya digunakan sebagai ruang cadangan dalam ilustrasi penggabungan, bukan subnet perangkat tambahan.  

Gambar pohon pembagian IP dibuat berdasarkan susunan tersebut:  

![Pohon CIDR K-64](IP-tree-and-subnetting/IP-Tree-CIDR.png)  

Ringkasan C5 dan C13 menunjukkan **penggabungan blok alamat secara matematis**, bukan konfigurasi route summarization OSPF yang otomatis diterapkan pada router.  

### Konfigurasi Topologi

Seluruh perangkat ditempatkan pada *Logical Workspace* Cisco Packet Tracer sesuai gambar acuan. Router menggunakan perangkat Cisco 2811, dihubungkan ke switch dan perangkat akhir sesuai topologi. Nama setiap perangkat disesuaikan dengan soal; kemudian port kedua ujung kabel diperiksa melalui informasi interface ketika kabel diarahkan kursor. Pada router yang memerlukan lebih banyak port, modul interface disesuaikan melalui tab **Physical**.  

Router **Wired** terhubung ke Cyberia, Navi, Tachibana, dan Switch2. Switch2 juga terhubung ke Psyche, Copland, dan Schumann. Router **Cyberia** menjadi satu-satunya router yang memiliki sambungan fisik langsung ke Cloud0.  

### Konfigurasi IP Address Router

Pada setiap router, konfigurasi dilakukan melalui menu **CLI**. Setelah masuk ke *privileged EXEC mode* menggunakan `enable`, perintah `configure terminal` digunakan untuk mengatur IP dan subnet mask interface. Perintah `no shutdown` mengaktifkan port yang digunakan.  

Konfigurasi Cyberia:  

```text
enable
configure terminal
hostname Cyberia
interface FastEthernet0/0
 ip address 192.243.30.1 255.255.255.128
 no shutdown
 exit
interface FastEthernet1/0
 ip address 192.243.0.57 255.255.255.252
 no shutdown
 exit
end
write memory
```

Sebagai contoh lain, konfigurasi port Wired yang terhubung ke router dan Switch2:  

```text
enable
configure terminal
hostname Wired
interface FastEthernet0/0
 ip address 192.243.0.58 255.255.255.252
 no shutdown
 exit
interface FastEthernet0/1
 ip address 192.243.0.61 255.255.255.252
 no shutdown
 exit
interface FastEthernet1/0
 ip address 192.243.0.65 255.255.255.252
 no shutdown
 exit
interface FastEthernet1/1
 ip address 192.243.0.33 255.255.255.248
 no shutdown
 exit
end
write memory
```

Contoh dokumentasi konfigurasi interface pada beberapa router:

![Konfigurasi IP router Psyche](asset/asset-cpt-cidr/Psyche_config.png)  
![Konfigurasi IP router Navi](asset/asset-cpt-cidr/Navi_config.png)  

Alamat interface yang digunakan pada keseluruhan 13 router adalah:  

| Router | Interface | Terhubung ke | IP Address / Prefix |
|---|---|---|---|
| Cyberia | `FastEthernet0/0` | Switch1 | `192.243.30.1/25` |
| Cyberia | `FastEthernet0/1` | Cloud0 | *Unassigned* (Cloud0) |
| Cyberia | `FastEthernet1/0` | Wired | `192.243.0.57/30` |
| Wired | `FastEthernet0/0` | Cyberia | `192.243.0.58/30` |
| Wired | `FastEthernet0/1` | Navi | `192.243.0.61/30` |
| Wired | `FastEthernet1/0` | Tachibana | `192.243.0.65/30` |
| Wired | `FastEthernet1/1` | Switch2 | `192.243.0.33/29` |
| Psyche | `FastEthernet0/0` | Switch2 | `192.243.0.34/29` |
| Psyche | `FastEthernet0/1` | Switch3 | `192.243.16.1/22` |
| Copland | `FastEthernet0/0` | Switch2 | `192.243.0.35/29` |
| Copland | `FastEthernet0/1` | Juri | `192.243.31.193/26` |
| Copland | `FastEthernet1/0` | Switch4 | `192.243.24.1/23` |
| Schumann | `FastEthernet0/0` | Switch2 | `192.243.0.36/29` |
| Schumann | `FastEthernet0/1` | Akashic | `192.243.0.41/29` |
| Schumann | `FastEthernet1/0` | Accela | `192.243.0.89/30` |
| Accela | `FastEthernet0/0` | Schumann | `192.243.0.90/30` |
| Accela | `FastEthernet0/1` | Switch5 | `192.243.20.1/22` |
| Navi | `FastEthernet0/0` | Wired | `192.243.0.62/30` |
| Navi | `FastEthernet0/1` | Switch6 | `192.243.28.1/24` |
| Navi | `FastEthernet1/0` | Switch7 | `192.243.31.65/26` |
| Navi | `FastEthernet1/1` | Switch8 | `192.243.29.1/24` |
| Tachibana | `FastEthernet0/0` | Wired | `192.243.0.66/30` |
| Tachibana | `FastEthernet0/1` | Deus | `192.243.0.69/30` |
| Tachibana | `FastEthernet1/0` | Switch9 | `192.243.26.1/23` |
| Deus | `FastEthernet0/0` | Tachibana | `192.243.0.70/30` |
| Deus | `FastEthernet0/1` | Switch10 | `192.243.30.129/25` |
| Deus | `FastEthernet1/0` | Protocol7 | `192.243.0.73/30` |
| Protocol7 | `FastEthernet0/0` | Deus | `192.243.0.74/30` |
| Protocol7 | `FastEthernet0/1` | Knights | `192.243.0.77/30` |
| Protocol7 | `FastEthernet1/0` | Switch11 | `192.243.31.129/26` |
| Knights | `FastEthernet0/0` | Protocol7 | `192.243.0.78/30` |
| Knights | `FastEthernet0/1` | Phantoma | `192.243.0.81/30` |
| Knights | `FastEthernet1/0` | Eiri | `192.243.0.49/29` |
| Phantoma | `FastEthernet0/0` | Knights | `192.243.0.82/30` |
| Phantoma | `FastEthernet0/1` | Shibuya | `192.243.0.85/30` |
| Phantoma | `FastEthernet1/0` | Switch12 | `192.243.0.1/27` |
| Shibuya | `FastEthernet0/0` | Phantoma | `192.243.0.86/30` |
| Shibuya | `FastEthernet0/1` | Switch13 | `192.243.31.1/26` |

### Pengujian Konfigurasi Interface

Setelah seluruh IP diatur, status interface diperiksa pada router menggunakan:  

```text
show ip interface brief
```

Pada port yang aktif dan tersambung, hasil pemeriksaan menunjukkan **Status up** dan **Protocol up**. Pada awal pengerjaan terdapat port `administratively down` atau `up/down` karena interface belum diaktifkan di kedua sisi. Setelah konfigurasi dilengkapi, koneksi internal yang diuji berubah menjadi `up/up`.  

### Konfigurasi IP Address Client

Alamat IPv4 perangkat akhir diatur melalui **Desktop → IP Configuration → Static**. Nilai IP Address dan Subnet Mask diisi sesuai subnet, sedangkan Default Gateway diarahkan ke alamat interface router pada jaringan tersebut.  

Pembagian IP pada 25 perangkat akhir:  

| Node | Interface | IP Address | Default Gateway |
|---|---|---|---|
| JJ | FastEthernet0 | `192.243.30.2/25` | `192.243.30.1` |
| MyuMyu | FastEthernet0 | `192.243.30.3/25` | `192.243.30.1` |
| Karl | FastEthernet0 | `192.243.16.2/22` | `192.243.16.1` |
| Lin | FastEthernet0 | `192.243.16.3/22` | `192.243.16.1` |
| Omnipresence | FastEthernet0 | `192.243.20.2/22` | `192.243.20.1` |
| Denpa | FastEthernet0 | `192.243.20.3/22` | `192.243.20.1` |
| Masayuki | FastEthernet0 | `192.243.24.2/23` | `192.243.24.1` |
| Juri | FastEthernet0 | `192.243.31.194/26` | `192.243.31.193` |
| Akashic | FastEthernet0 | `192.243.0.42/29` | `192.243.0.41` |
| Collective | FastEthernet0 | `192.243.26.2/23` | `192.243.26.1` |
| Ghost | FastEthernet0 | `192.243.26.3/23` | `192.243.26.1` |
| Alice | FastEthernet0 | `192.243.28.2/24` | `192.243.28.1` |
| Reika | FastEthernet0 | `192.243.28.3/24` | `192.243.28.1` |
| Yasuo | FastEthernet0 | `192.243.29.2/24` | `192.243.29.1` |
| Miho | FastEthernet0 | `192.243.29.3/24` | `192.243.29.1` |
| Kuma | FastEthernet0 | `192.243.29.4/24` | `192.243.29.1` |
| Taro | FastEthernet0 | `192.243.31.66/26` | `192.243.31.65` |
| Lilith | FastEthernet0 | `192.243.30.130/25` | `192.243.30.129` |
| Specter | FastEthernet0 | `192.243.30.131/25` | `192.243.30.129` |
| Chisa | FastEthernet0 | `192.243.31.130/26` | `192.243.31.129` |
| Hodgeson | FastEthernet0 | `192.243.31.131/26` | `192.243.31.129` |
| Eiri | FastEthernet0 | `192.243.0.50/29` | `192.243.0.49` |
| Semi | FastEthernet0 | `192.243.0.2/27` | `192.243.0.1` |
| Lain | FastEthernet0 | `192.243.31.2/26` | `192.243.31.1` |
| Mika | FastEthernet0 | `192.243.31.3/26` | `192.243.31.1` |

![Konfigurasi perangkat JJ](asset/asset-cpt-cidr/JJ.png)  

Contoh pengaturan pada JJ adalah IP `192.243.30.2`, netmask `255.255.255.128`, dan gateway `192.243.30.1`. Setelah pengalamatan, koneksi lokal diuji menggunakan:  

```text
ping 192.243.30.1
ping 192.243.30.3
```

Hasil PING dari JJ ke gateway Cyberia dan MyuMyu berhasil. Pengujian lokal serupa dilakukan pada beberapa subnet lain sebelum routing antarsubnet diaktifkan.  

### Konfigurasi Routing OSPF

Pada tahap ini OSPF diaktifkan pada seluruh **13 router** agar jaringan yang berbeda dapat saling dihubungkan. Konfigurasi dasar yang sama diterapkan pada masing-masing router:  

```text
enable
configure terminal
router ospf 1
 network 192.243.0.0 0.0.31.255 area 0
end
write memory
```

Perintah di atas memilih interface internal yang IP-nya berada dalam rentang `192.243.0.0/19` untuk mengikuti OSPF area 0. Setelah konfigurasi dijalankan, dilakukan pemeriksaan:  

```text
show ip ospf neighbor
show ip route ospf
```

Status **FULL/DR** atau **FULL/BDR** pada `show ip ospf neighbor` menandakan hubungan tetangga yang sudah terbentuk. Pada segmen bersama di Switch2, hubungan sesama router bertipe DROTHER dapat menampilkan status **2WAY/DROTHER**. Entri bertanda `O` pada tabel routing menunjukkan rute yang dipelajari melalui OSPF.  

![Hasil OSPF pada Cyberia dan Wired](asset/asset-cpt-cidr/OSPF/Cyberia_Wired.png)  
![Hasil OSPF pada Deus dan Protocol7](asset/asset-cpt-cidr/OSPF/Deus_Protocol7.png)  
![Hasil OSPF pada Schumann dan Accela](asset/asset-cpt-cidr/OSPF/Schumann_Accela.png)  

### Optimasi Passive-Interface

Untuk mengurangi paket Hello OSPF ke jaringan yang hanya berisi client, `passive-interface` diterapkan pada port menuju LAN host. Port antarrouter tetap dibiarkan aktif agar pertukaran rute berlangsung.  

Contoh konfigurasi pada Accela:  

```text
enable
configure terminal
router ospf 1
 passive-interface FastEthernet0/1
end
write memory
```

Daftar interface yang dibuat passive:  

| Router | Interface Passive |
|---|---|
| Cyberia | `FastEthernet0/0` |
| Wired | Tidak ada |
| Psyche | `FastEthernet0/1` |
| Copland | `FastEthernet0/1`, `FastEthernet1/0` |
| Schumann | `FastEthernet0/1` |
| Accela | `FastEthernet0/1` |
| Navi | `FastEthernet0/1`, `FastEthernet1/0`, `FastEthernet1/1` |
| Tachibana | `FastEthernet1/0` |
| Deus | `FastEthernet0/1` |
| Protocol7 | `FastEthernet1/0` |
| Knights | `FastEthernet1/0` |
| Phantoma | `FastEthernet1/0` |
| Shibuya | `FastEthernet0/1` |

![Hasil pemeriksaan OSPF setelah optimasi](asset/asset-cpt-cidr/OSPF_OPTIMALISASI/Cyberia_Wired.png)  
![Optimasi OSPF Schumann dan Tachibana](asset/asset-cpt-cidr/OSPF_OPTIMALISASI/Schumann_Tachibana.png)  

Setelah passive-interface diterapkan, dilakukan ulang pengecekan `show ip ospf neighbor` dan pengujian PING antarsubnet. Router tetap dapat bertukar rute melalui interface penghubungnya.  

### Konfigurasi Koneksi Cloud0

Pada Cyberia, interface **FastEthernet0/1** yang mengarah ke Cloud0 pada awalnya `administratively down`. Interface kemudian diaktifkan dengan:  

```text
configure terminal
interface FastEthernet0/1
 no shutdown
exit
end
write memory
```

<!-- Bukti Cloud0: isi path setelah gambar Cloud0 tersedia di repository. -->
Hasil `show ip interface brief` menunjukkan `FastEthernet0/1` **up/up**, tetapi **IP-Address unassigned**. Artinya, kabel dan status fisik Cloud0 sudah aktif; **akses eksternal, NAT, maupun alamat gateway WAN belum dikonfigurasi atau diverifikasi** pada pengujian ini.  

### Pengujian Konektivitas Antar-Subnet

Setelah seluruh router membentuk jaringan OSPF, pengujian PING dilakukan dari perangkat yang berada pada cabang berbeda. Contoh dari JJ:  

```text
ping 192.243.31.2
ping 192.243.29.4
ping 192.243.20.3
ping 192.243.16.2
```

Beberapa hasil pengujian lintas cabang:  

| Sumber | Tujuan | Hasil terakhir |
|---|---|---|
| JJ | Lain (`192.243.31.2`) | 4/4 diterima (0% loss) |
| Karl | Kuma (`192.243.29.4`) | 4/4 diterima (0% loss) |
| Omnipresence | Hodgeson (`192.243.31.131`) | 4/4 diterima (0% loss) |
| Lain | Karl (`192.243.16.2`) | 4/4 diterima (0% loss) |
| Eiri | Collective (`192.243.26.2`) | 4/4 diterima (0% loss) |
| Kuma | Semi (`192.243.0.2`) | 4/4 diterima (0% loss) |

Selanjutnya dilakukan pengujian konektivitas dari **JJ (`192.243.30.2`) ke 24 perangkat akhir lain**, kemudian PING balik dari 24 perangkat akhir tersebut ke JJ.  

| Pengujian | Hasil |
|---|---|
| JJ → 24 host lainnya | 24/24 tujuan dapat dijangkau |
| 24 host lainnya → JJ | 24/24 sumber dapat menjangkau JJ |

![Pengujian dari JJ ke host](asset/asset-cpt-cidr/OSPF_OPTIMALISASI/JJ_lain.png)  

![Pengujian balik dari Yasuo dan Juri ke JJ](asset/asset-cpt-cidr/OSPF_OPTIMALISASI/ping%20ke%20JJ_8.png)  

Dokumentasi pengujian lainnya:  

![Pengujian JJ ke host 1](asset/asset-cpt-cidr/OSPF_OPTIMALISASI/ping_jauh.png)  
![Pengujian JJ ke host 2](asset/asset-cpt-cidr/OSPF_OPTIMALISASI/ping_jauh_2.png)  
![Pengujian JJ ke host 3](asset/asset-cpt-cidr/OSPF_OPTIMALISASI/ping_jauh_3.png)  
![Pengujian JJ ke host 4](asset/asset-cpt-cidr/OSPF_OPTIMALISASI/ping_jauh_4.png)  
![Pengujian JJ ke host 5](asset/asset-cpt-cidr/OSPF_OPTIMALISASI/ping_jauh_5.png)  
![Pengujian JJ ke host 6](asset/asset-cpt-cidr/OSPF_OPTIMALISASI/ping_jauh_6.png)  
![Pengujian JJ ke host 7](asset/asset-cpt-cidr/OSPF_OPTIMALISASI/ping_jauh_7.png)  
![Pengujian JJ ke host 8](asset/asset-cpt-cidr/OSPF_OPTIMALISASI/ping_jauh_8.png)  
![Pengujian host ke JJ 1](asset/asset-cpt-cidr/OSPF_OPTIMALISASI/ping%20ke%20JJ_1.png)  
![Pengujian host ke JJ 2](asset/asset-cpt-cidr/OSPF_OPTIMALISASI/ping%20ke%20JJ_2.png)  
![Pengujian host ke JJ 3](asset/asset-cpt-cidr/OSPF_OPTIMALISASI/ping%20ke%20JJ_3.png)  
![Pengujian host ke JJ 4](asset/asset-cpt-cidr/OSPF_OPTIMALISASI/ping%20ke%20JJ_4.png)  
![Pengujian host ke JJ 5](asset/asset-cpt-cidr/OSPF_OPTIMALISASI/ping%20ke%20JJ_5.png)  
![Pengujian host ke JJ 6](asset/asset-cpt-cidr/OSPF_OPTIMALISASI/ping%20ke%20JJ_6.png)  
![Pengujian host ke JJ 7](asset/asset-cpt-cidr/OSPF_OPTIMALISASI/ping%20ke%20JJ_7.png)  
![Pengujian host ke JJ 8](asset/asset-cpt-cidr/OSPF_OPTIMALISASI/ping%20ke%20JJ_8.png)  

Pada sebagian host PING pertama sempat mengalami *request timed out* atau kehilangan satu paket. Setelah diulang, seluruh host yang diuji kembali memberikan respons **4/4**. Pengujian melalui JJ menunjukkan konektivitas dua arah ke seluruh perangkat akhir, **tetapi tidak mencakup setiap kombinasi pasangan host secara langsung**.  

### Kendala dan Penyelesaian

| Kendala | Penyelesaian |
|---|---|
| Perintah `configure terminal` ditolak saat prompt masih `Router>` | Menjalankan `enable` agar masuk ke `Router#` sebelum konfigurasi. |
| Muncul `Translating "end"...` | Router menafsirkan perintah pada mode yang salah sebagai DNS lookup; proses dibatalkan lalu digunakan mode CLI yang sesuai. |
| Interface `administratively down` | Mengaktifkan interface menggunakan `no shutdown`. |
| Interface `up/down` | Memeriksa serta mengaktifkan port pasangan di sisi perangkat lain. |
| Tabel rute OSPF belum muncul saat awal konfigurasi | Memeriksa adjacency OSPF dan melakukan pengecekan ulang setelah rute dipelajari. |
| PING awal kehilangan satu paket | Mengulangi PING setelah ARP/konvergensi jaringan selesai. |

### Analisis

Penggunaan CIDR memungkinkan 25 segmen memperoleh subnet sesuai kebutuhannya tanpa menggunakan ukuran yang sama untuk semua jaringan. Total kebutuhan **2.814 alamat** dicakup oleh **4.188 alamat yang dialokasikan**. Koneksi antarrouter mendapat prefix `/30`, sementara segmen dengan banyak host menggunakan `/22`, `/23`, `/24`, dan prefix lain yang sesuai.  

OSPF digunakan untuk pertukaran rute antarrouter sehingga perangkat di subnet berbeda dapat berkomunikasi. Pengaturan passive-interface menjaga agar jaringan host tetap diiklankan, tetapi paket Hello OSPF tidak perlu dikirim ke host. Hal ini terbukti tidak mengganggu PING lintas subnet yang dilakukan.  

Hasil tes menunjukkan **24 dari 24 perangkat akhir lainnya dapat diping dari JJ dan semuanya juga dapat meming JJ**. Koneksi fisik Cloud0 sudah aktif, tetapi keberhasilan jaringan internal tidak menjadi bukti akses jaringan eksternal.  

### Hasil Akhir dan Dokumentasi

Konfigurasi topologi CPT, pembagian IP CIDR, OSPF, dan optimasi passive-interface sudah diterapkan dan proyek **Cisco Packet Tracer (`.pkt`)** telah disimpan. Dokumentasi pendukung terdiri atas spreadsheet subnetting, gambar pohon CIDR, file perintah konfigurasi router/OSPF, serta screenshot pengujian. Pengumpulan file GNS3/VLSM merupakan bagian terpisah dari pekerjaan CPT–CIDR ini.


## Perancangan Menggunakan GNS3 dengan VLSM

### 1. Pendahuluan

Dilakukan perancangan dan implementasi topologi jaringan menggunakan **Graphical Network Simulator-3 (GNS3)** dengan menerapkan metode **Variable Length Subnet Mask (VLSM)**.

VLSM merupakan metode pembagian jaringan yang memungkinkan penggunaan subnet mask dengan panjang prefix berbeda sesuai kebutuhan jumlah host pada setiap subnet. Dengan metode ini, alokasi alamat IP dapat dilakukan secara lebih efisien karena setiap jaringan memperoleh kapasitas alamat sesuai kebutuhan.

Implementasi dilakukan menggunakan 13 router berbasis Linux yang saling terhubung untuk membentuk topologi jaringan. Selain melakukan pembagian alamat IP, dilakukan pula konfigurasi interface, routing, serta pengujian konektivitas antarsubnet hingga koneksi menuju jaringan internet.

### 2. Perancangan Alamat IP dengan Metode VLSM

#### 2.1. Jaringan Utama

Jaringan utama yang digunakan dalam perancangan ini adalah:

- Network Address: `192.243.0.0/19`
- Subnet Mask: `255.255.224.0`
- Total alamat IP: 8192 alamat
- Rentang alamat: `192.243.0.0 – 192.243.31.255`

Pembagian subnet dilakukan berdasarkan kebutuhan host pada masing-masing jaringan. Subnet dengan kebutuhan host lebih besar dialokasikan terlebih dahulu, kemudian dilanjutkan dengan subnet berkapasitas lebih kecil.

![subnet](ip-tree-and-subnetting/IP-Tree-VLSM.png)

#### 2.2. Pembagian Subnet

![subnet](ip-tree-and-subnetting/Subnet-VLSM.png)

Hasil pembagian alamat IP menggunakan metode VLSM menghasilkan 25 subnet, yaitu A1 hingga A25.

| Subnet | Jaringan | Network Address | Prefix |
|---|---|---|---|
| A1 | Cyberia – Switch1 | 192.243.14.0 | /25 |
| A2 | Cyberia – Wired | 192.243.16.56 | /30 |
| A3 | Psyche – Switch3 | 192.243.0.0 | /22 |
| A4 | Accela – Switch5 | 192.243.4.0 | /22 |
| A5 | Copland – Switch4 | 192.243.8.0 | /23 |
| A6 | Tachibana – Switch9 | 192.243.10.0 | /23 |
| A7 | Navi – Switch6 | 192.243.12.0 | /24 |
| A8 | Navi – Switch8 | 192.243.13.0 | /24 |
| A9 | Deus – Switch10 | 192.243.14.128 | /25 |
| A10 | Shibuya – Switch13 | 192.243.15.0 | /26 |
| A11 | Navi – Switch7 | 192.243.15.64 | /26 |
| A12 | Protocol7 – Switch11 | 192.243.15.128 | /26 |
| A13 | Copland – Juri | 192.243.15.192 | /26 |
| A14 | Phantoma – Switch12 | 192.243.16.0 | /27 |
| A15 | Wired, Psyche, Copland, Schumann | 192.243.16.32 | /29 |
| A16 | Schumann – Akashic | 192.243.16.40 | /29 |
| A17 | Knights – Eiri | 192.243.16.48 | /29 |
| A18 | Wired – Navi | 192.243.16.60 | /30 |
| A19 | Wired – Tachibana | 192.243.16.64 | /30 |
| A20 | Tachibana – Deus | 192.243.16.68 | /30 |
| A21 | Deus – Protocol7 | 192.243.16.72 | /30 |
| A22 | Protocol7 – Knights | 192.243.16.76 | /30 |
| A23 | Knights – Phantoma | 192.243.16.80 | /30 |
| A24 | Phantoma – Shibuya | 192.243.16.84 | /30 |
| A25 | Schumann – Accela | 192.243.16.88 | /30 |

Pemilihan prefix disesuaikan dengan kebutuhan masing-masing jaringan. Subnet dengan jumlah host besar menggunakan prefix seperti `/22`, `/23`, dan `/24`, sedangkan koneksi point-to-point ant arouter menggunakan `/30` karena hanya membutuhkan dua alamat IP yang dapat digunakan.

Subnet A15 menggunakan `/29` karena menghubungkan empat router dalam satu jaringan bersama. Sementara itu, A16 dan A17 menggunakan `/29` untuk menyediakan kapasitas alamat yang mencukupi bagi koneksi router dan perangkat tujuan.

#### 2.3. Contoh Perhitungan Subnet

Sebagai contoh, subnet A2 menggunakan network address `192.243.16.56/30`.

Dengan prefix `/30`, subnet tersebut memiliki:
- Subnet Mask: `255.255.255.252`
- Network Address: `192.243.16.56`
- Host pertama: `192.243.16.57`
- Host kedua: `192.243.16.58`
- Broadcast Address: `192.243.16.59`

Alamat IP tersebut kemudian digunakan untuk menghubungkan router Cyberia dengan router Wired.

### 3. Implementasi Topologi pada GNS3

#### 3.1. Pembuatan Topologi

Implementasi jaringan dilakukan menggunakan GNS3 dengan memanfaatkan router berbasis Linux. Topologi terdiri dari 13 router, yaitu:

1. Cyberia
2. Wired
3. Psyche
4. Accela
5. Copland
6. Tachibana
7. Navi
8. Deus
9. Protocol7
10. Knights
11. Phantoma
12. Shibuya
13. Schumann

Setiap router dihubungkan sesuai rancangan topologi. Beberapa router terhubung secara langsung menggunakan interface Ethernet, sedangkan jaringan LAN menggunakan switch sebagai penghubung antara router dan end device.

ss

#### 3.2. Pemetaan Interface

Setiap interface pada router memiliki fungsi dan alamat IP yang berbeda sesuai subnet yang digunakan. Sebagai contoh, router Cyberia memiliki tiga interface utama:

| Interface | Koneksi | Alamat IP |
|---|---|---|
| eth0 | NAT1 | DHCP |
| eth1 | Wired | 192.243.16.57/30 |
| eth2 | Switch1 | 192.243.14.1/25 |

Pemetaan interface dilakukan agar setiap alamat IP ditempatkan pada koneksi yang sesuai dengan rancangan topologi.

### 4. Konfigurasi IP Address

Konfigurasi alamat IP dilakukan melalui terminal Linux pada masing-masing router. Berbeda dengan konfigurasi router Cisco, konfigurasi pada router Linux menggunakan perintah `ip addr`.

Contoh konfigurasi pada router Cyberia:

```bash
ip addr replace 192.243.16.57/30 dev eth1
ip addr replace 192.243.14.1/25 dev eth2
```

Perintah tersebut digunakan untuk memasang alamat IP pada interface `eth1` dan `eth2`.

Untuk memeriksa konfigurasi alamat IP yang telah diterapkan, digunakan perintah:

```bash
ip -br addr
```

Perintah tersebut menampilkan daftar interface beserta alamat IP secara ringkas sehingga memudahkan pemeriksaan konfigurasi.

![cyberia](asset/asset-gns-vlsm/cyberia.png)

### 5. Konfigurasi Routing

#### 5.1. Mengaktifkan IP Forwarding

Agar router dapat meneruskan paket dari satu jaringan menuju jaringan lainnya, fitur IP forwarding perlu diaktifkan.

Perintah yang digunakan:

```bash
sysctl -w net.ipv4.ip_forward=1
```

Untuk memeriksa apakah IP forwarding telah aktif:

```bash
sysctl net.ipv4.ip_forward
```

Apabila konfigurasi berhasil, terminal akan menampilkan:

```text
net.ipv4.ip_forward = 1
```

Nilai `1` menunjukkan bahwa router telah diizinkan meneruskan paket IPv4 antarmuka jaringan.

#### 5.2. Konfigurasi Routing

Routing dikonfigurasi menggunakan perintah `ip route replace` untuk menentukan jalur yang digunakan ketika paket dikirim menuju jaringan lain.

Contoh konfigurasi pada router Cyberia:

```bash
ip route replace 192.243.0.0/19 via 192.243.16.58 dev eth1
```

Perintah tersebut mengarahkan trafik menuju jaringan `192.243.0.0/19` melalui router Wired dengan alamat IP `192.243.16.58` melalui interface `eth1`.

Untuk melihat tabel routing yang telah dikonfigurasi, digunakan perintah:

```bash
ip route
```

Tabel routing digunakan untuk memastikan bahwa router memiliki informasi jalur menuju jaringan tujuan.

![wired](asset/asset-gns-vlsm/wired.png)

### 6. Konfigurasi Koneksi Internet

Router Cyberia berperan sebagai gateway yang menghubungkan jaringan internal dengan jaringan luar melalui interface NAT.

#### 6.1. Mendapatkan Alamat IP dari DHCP

Interface `eth0` pada router Cyberia dihubungkan ke NAT GNS3. Alamat IP diperoleh secara otomatis melalui DHCP menggunakan perintah:

```bash
udhcpc -i eth0
```

Berdasarkan hasil konfigurasi, interface tersebut memperoleh alamat IP `192.168.122.144/24` dengan gateway `192.168.122.1`.

#### 6.2. Konfigurasi Default Route

Agar trafik menuju jaringan luar dapat diteruskan melalui gateway NAT, digunakan perintah:

```bash
ip route replace default via 192.168.122.1 dev eth0
```

#### 6.3. Konfigurasi NAT

Network Address Translation (NAT) digunakan agar perangkat pada jaringan internal dapat mengakses jaringan luar melalui alamat IP interface eksternal Cyberia.

Konfigurasi dilakukan menggunakan:

```bash
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
```

Dengan konfigurasi tersebut, alamat sumber paket dari jaringan internal akan disesuaikan menggunakan alamat IP interface keluar Cyberia.

![cyberia](asset/asset-gns-vlsm/cyberia.png)

### 7. Pengujian Konektivitas

Setelah konfigurasi alamat IP dan routing selesai dilakukan, pengujian dilakukan untuk memastikan komunikasi antarperangkat dapat berjalan dengan baik.

Pengujian dilakukan menggunakan perintah `ping` dengan mengirimkan empat paket ICMP ke alamat IP tujuan.

#### 7.1. Pengujian Antarrouter

Pengujian dilakukan terhadap koneksi langsung antarrouter untuk memastikan setiap link telah dikonfigurasi dengan benar.

Contoh:

```bash
ping -c 4 192.243.16.57
```

Pengujian koneksi antarrouter dilakukan pada setiap link yang terhubung dalam topologi.

#### 7.2. Pengujian Antarjaringan

Pengujian juga dilakukan dari end device untuk memastikan perangkat dapat berkomunikasi dengan perangkat lain yang berada pada subnet berbeda.

Salah satu pengujian dilakukan dari perangkat JJ menuju perangkat lain pada jaringan.

![jj](asset/asset-gns-vlsm/jj-ping-01.png)
![jj](asset/asset-gns-vlsm/jj-ping-02.png)

#### 7.3. Pengujian Koneksi Internet

Pengujian koneksi internet dilakukan dari perangkat JJ dengan mengirimkan paket ICMP menuju alamat IP publik `8.8.8.8`.

Perintah yang digunakan:

```bash
ping -c 4 8.8.8.8
```

Hasil pengujian menunjukkan bahwa keempat paket berhasil diterima dengan persentase packet loss sebesar 0%.

Hasil tersebut menunjukkan bahwa perangkat pada jaringan internal telah berhasil mengakses alamat IP publik melalui gateway Cyberia.

![jj](asset/asset-gns-vlsm/jj-ping-8-8-8-8.png)

### 8. Kendala dan Penyelesaian

Selama proses implementasi jaringan menggunakan GNS3, terdapat beberapa kendala yang perlu diselesaikan.

| Kendala | Penyelesaian |
|---|---|
| Kesalahan pemilihan interface saat konfigurasi IP | Memeriksa interface menggunakan `ip -br addr` sebelum memasang alamat IP. |
| Koneksi antarrouter belum berhasil | Memeriksa pemetaan interface, alamat IP, prefix, serta koneksi antarnode. |
| Perintah konfigurasi tidak tersimpan setelah router dijalankan ulang | Menyimpan konfigurasi ke dalam file `/root/config.sh` agar dapat dijalankan kembali. |
| Perangkat internal belum dapat mengakses jaringan luar | Memeriksa DHCP, default route, IP forwarding, dan konfigurasi NAT pada Cyberia. |

Untuk menjaga konfigurasi agar dapat diterapkan kembali, perintah-perintah konfigurasi disimpan dalam file `config.sh` pada masing-masing router.

### 9. Analisis

Berdasarkan implementasi yang dilakukan, metode VLSM memungkinkan pembagian alamat IP dengan kapasitas subnet yang disesuaikan terhadap kebutuhan host pada masing-masing jaringan. Penggunaan prefix yang berbeda membantu menghindari penggunaan alamat IP secara berlebihan.

Implementasi pada GNS3 menggunakan router berbasis Linux sehingga konfigurasi jaringan dilakukan melalui perintah terminal. Pengaturan alamat IP menggunakan `ip addr`, pengaturan jalur komunikasi menggunakan `ip route`, serta pengaktifan penerusan paket menggunakan IP forwarding.

Pengujian konektivitas menunjukkan bahwa komunikasi antarperangkat dapat dilakukan setelah konfigurasi alamat IP dan routing diterapkan. Selain itu, keberhasilan pengujian dari JJ menuju `8.8.8.8` menunjukkan bahwa konfigurasi gateway dan NAT pada Cyberia telah memungkinkan jaringan internal mengakses jaringan luar.

### 10. Kesimpulan

Berdasarkan praktikum yang telah dilakukan, perancangan jaringan menggunakan GNS3 dengan metode VLSM berhasil diimplementasikan berdasarkan pembagian 25 subnet dari jaringan utama `192.243.0.0/19`.

Konfigurasi dilakukan pada 13 router berbasis Linux dengan pengaturan alamat IP, routing, dan IP forwarding. Router Cyberia juga dikonfigurasi sebagai gateway untuk menghubungkan jaringan internal dengan jaringan luar melalui NAT.

Hasil pengujian menunjukkan bahwa konektivitas antarjaringan berhasil dilakukan dan perangkat JJ dapat mengakses alamat IP publik `8.8.8.8` dengan 0% packet loss. Dengan demikian, implementasi topologi jaringan menggunakan metode VLSM pada GNS3 telah berhasil dilakukan sesuai rancangan.