#!/bin/bash

if [ $EUID -ne 0 ]; then
    echo "$0 is not running as root. Try using sudo."
    exit 2
fi

apt install docker git -y
mkdir /mnt/xvdh
mkfs -t ext4 /dev/nvme1n1
echo '/dev/nvme1n1       /mnt/xvdh   ext4    defaults,nofail 0 2' >> /etc/fstab
mount -a
git clone https://github.com/discourse/discourse_docker.git /mnt/xvdh/discourse
