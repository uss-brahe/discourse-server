#!/bin/bash

# install dependencies
apt install docker git -y

# uninstall apache because it uses port 80
sudo apt remove apache2 -y --purge

# mount new volume
mkdir -p /mnt/xvdh
mkfs -t ext4 /dev/nvme1n1
echo '/dev/nvme1n1       /mnt/xvdh   ext4    defaults,nofail 0 2' >> /etc/fstab
mount -a

# extend the swap space (Discourse requires at least 2 GB)
/bin/dd if=/dev/zero of=/mnt/xvdh/swap.1 bs=1M count=2048
/sbin/mkswap /mnt/xvdh/swap.1
chmod 600 /mnt/xvdh/swap.1
/sbin/swapon /mnt/xvdh/swap.1

# clone discourse
git clone https://github.com/discourse/discourse_docker.git /mnt/xvdh/discourse
