#!/bin/bash

lsblk
zpool list
zpool status

zpool create otus1 mirror /dev/sdb /dev/sdc
zpool create otus2 mirror /dev/sdd /dev/sde
zpool create otus3 mirror /dev/sdf /dev/sdg
zpool create otus4 mirror /dev/sdh /dev/sdi

zfs set compression=lzjb otus1
zfs set compression=lz4 otus2
zfs set compression=gzip-9 otus3
zfs set compression=zle otus4

zfs get all | grep compression

for i in {1..4}; do wget -P /otus$i https://gutenberg.org/cache/epub/2600/pg2600.converter.log; done

ls -l /otus*



zfs get all | grep compressratio | grep -v ref

wget -O archive.tar.gz --no-check-certificate 'https://drive.usercontent.google.com/download?id=1MvrcEp-WgAQe57aDEzxSRalPAwbNN1Bb&export=download'

tar -xzvf archive.tar.gz

zpool import -d zpoolexport/
zpool import -d zpoolexport/ otus
zpool status

zpool get all otus
zfs get all otus
zfs get available otus
zfs get readonly otus
zfs get recordsize otus
zfs get compression otus
zfs get checksum otus

wget -O otus_task2.file --no-check-certificate 'https://drive.usercontent.google.com/download?id=1wgxjih8YZ-cqLqaZVa0lA3h3Y029c3oI&export=download'

zfs receive otus/test@today < otus_task2.file

find /otus/test -name "secret_message"

cat /otus/test/task1/file_mess/secret_message




