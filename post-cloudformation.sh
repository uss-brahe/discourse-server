#!/usr/bin/env bash

sudo apt install docker git -y
sudo mkdir /mnt/xvdh
sudo mkfs -t ext4 /dev/nvme1n1
sudo sh -c "echo '/dev/nvme1n1       /mnt/xvdh   ext4    defaults,nofail 0 2' >> /etc/fstab"
sudo mount -a
sudo git clone https://github.com/discourse/discourse_docker.git /mnt/xvdh/discourse
