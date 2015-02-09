# asuswrt-merlin
Asuswrt-Merlin user scripts

## Sync scripts from router
```
rsync -rvt -e ssh --include=firewall-start --include=peerguardian2 --exclude=* admin@192.168.1.1:/tmp/mnt/SanDisk_Cruzer/scripts/ jffs/scripts/

rsync -rvt -e ssh admin@192.168.1.1:/tmp/mnt/SanDisk_Cruzer/ipset_lists/ jffs/ipset_lists/
```

### View iptables FORWARD chain
```
# iptables --line-numbers -nvL FORWARD
Chain FORWARD (policy DROP 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
1        0     0 DROP       all  --  *      *       0.0.0.0/0            192.168.1.60         match-set block_li src
2        0     0 DROP       all  --  *      *       192.168.1.60         0.0.0.0/0            match-set block_li dst
3        0     0 DROP       all  --  *      *       0.0.0.0/0            192.168.1.60         match-set block_kh src
4        0     0 DROP       all  --  *      *       192.168.1.60         0.0.0.0/0            match-set block_kh dst
5        8   486 DROP       all  --  *      *       0.0.0.0/0            192.168.1.60         match-set block_ng src
6       10   600 DROP       all  --  *      *       192.168.1.60         0.0.0.0/0            match-set block_ng dst
7        9   504 DROP       all  --  *      *       0.0.0.0/0            192.168.1.60         match-set block_ua src
8      263 30952 DROP       all  --  *      *       192.168.1.60         0.0.0.0/0            match-set block_ua dst
9      171  9994 DROP       all  --  *      *       0.0.0.0/0            192.168.1.60         match-set block_in src
10     546 43962 DROP       all  --  *      *       192.168.1.60         0.0.0.0/0            match-set block_in dst
11       6   606 DROP       all  --  *      *       0.0.0.0/0            192.168.1.60         match-set block_pk src
12     113  9561 DROP       all  --  *      *       192.168.1.60         0.0.0.0/0            match-set block_pk dst
13       0     0 DROP       all  --  *      *       0.0.0.0/0            192.168.1.60         match-set block_af src
14      10   600 DROP       all  --  *      *       192.168.1.60         0.0.0.0/0            match-set block_af dst
15      93  5301 DROP       all  --  *      *       0.0.0.0/0            192.168.1.60         match-set block_cn src
16    1563  160K DROP       all  --  *      *       192.168.1.60         0.0.0.0/0            match-set block_cn dst
17     120  7013 DROP       all  --  *      *       0.0.0.0/0            192.168.1.60         match-set block_br src
18     475 36044 DROP       all  --  *      *       192.168.1.60         0.0.0.0/0            match-set block_br dst
19    5349  264K DROP       all  --  *      *       0.0.0.0/0            192.168.1.60         match-set BluetackLevel1 src
20    1501 92210 DROP       all  --  *      *       192.168.1.60         0.0.0.0/0            match-set BluetackLevel1 dst
21   23912 5747K ACCEPT     all  --  tun21  *       0.0.0.0/0            0.0.0.0/0           
22    716K  122M ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
23       0     0 DROP       all  --  !br0   vlan2   0.0.0.0/0            0.0.0.0/0           
24    6486  348K DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            state INVALID
25    1462 87720 ACCEPT     all  --  br0    br0     0.0.0.0/0            0.0.0.0/0           
26   39815 2189K ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate DNAT
27    165K   13M ACCEPT     all  --  br0    *       0.0.0.0/0            0.0.0.0/0 
```
### View iptables INPUT chain
```
# iptables --line-numbers -nvL INPUT
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
1    26900 1559K ACCEPT     all  --  tun21  *       0.0.0.0/0            0.0.0.0/0           
2    51291   11M ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpt:1194
3        0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            match-set Whitelist src
4        0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            match-set block_li src
5        0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            match-set block_kh src
6        5   661 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            match-set block_ng src
7      965  124K DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            match-set block_ua src
8      221 26293 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            match-set block_in src
9       54  7073 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            match-set block_pk src
10       1    95 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            match-set block_af src
11    2586  300K DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            match-set block_cn src
12     247 31565 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            match-set block_br src
13       1    86 logdrop    all  --  *      *       0.0.0.0/0            0.0.0.0/0            match-set TorNodes src
14       1    72 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpt:4672
15       0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpt:4665
16       0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:4662
17      18   912 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:51413
18      20  1454 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpt:51413
19   14445  597K DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            state INVALID
20    946K  165M ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
21     671 84128 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0            state NEW
22    159K   14M ACCEPT     all  --  br0    *       0.0.0.0/0            0.0.0.0/0            state NEW
23       1   329 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp spt:67 dpt:68
24       0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:8082
25      11   540 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:443
26     124  5348 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0           
27   32740 3020K DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           
```
