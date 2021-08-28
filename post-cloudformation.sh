#!/bin/bash
apt install docker git -y
mkdir -p /mnt/xvdh
mkfs -t ext4 /dev/nvme1n1
echo '/dev/nvme1n1       /mnt/xvdh   ext4    defaults,nofail 0 2' >> /etc/fstab
mount -a
git clone https://github.com/discourse/discourse_docker.git /mnt/xvdh/discourse
