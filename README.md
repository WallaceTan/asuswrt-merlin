# asuswrt-merlin
Asuswrt-Merlin user scripts

## Sync scripts from router
```
rsync -rvt -e ssh --include=firewall-start --include=peerguardian2 --exclude=* admin@192.168.1.1:/tmp/mnt/SanDisk_Cruzer/scripts/ jffs/scripts/

rsync -rvt -e ssh admin@192.168.1.1:/tmp/mnt/SanDisk_Cruzer/ipset_lists/ jffs/ipset_lists/
```

