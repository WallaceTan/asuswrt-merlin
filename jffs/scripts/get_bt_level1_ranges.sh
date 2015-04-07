#!/bin/sh

# http://dustinhatch.tumblr.com/post/33821945832/using-peerblock-lists-on-linux
# http://www.bluetack.co.uk/converter/

FILE_PATH="`dirname \"$0\"`"
LEVEL1_URL="http://list.iblocklist.com/?list=bt_level1&fileformat=p2p&archiveformat=gz"
#LEVEL1_URL="http://list.iblocklist.com/?list=ydxerpxkpcfqjaybcssw&fileformat=p2p&archiveformat=gz"
WGET=/usr/bin/wget
CURL=/opt/bin/curl
GUNZIP=/bin/gunzip
CUT=/usr/bin/cut
GREP=/bin/grep
SCP=/usr/bin/scp

echo "$CURL --silent -L \"${LEVEL1_URL}\" | $GUNZIP | $CUT -d: -f2 | $GREP -E \"^[-0-9.]+$\" > $FILE_PATH/bt_level1_ranges.txt"
$CURL --silent -L "${LEVEL1_URL}" | $GUNZIP | $CUT -d: -f2 | $GREP -E "^[-0-9.]+$" > $FILE_PATH/bt_level1_ranges.txt

# SCP to Synology
$SCP -i $FILE_PATH/id_rsa $FILE_PATH/bt_level1_ranges.txt root@192.168.1.60:/volume1/web/bt_level1_ranges.txt

exit 0
