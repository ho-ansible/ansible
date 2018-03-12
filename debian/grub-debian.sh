#! /bin/sh
## Configure grub for auto-install of Debian from ISO

repo=https://github.com/ho-ansible/grub-debian
iso=https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-9.4.0-amd64-netinst.iso

cd /boot
git clone $repo
cd $(basename $repo)

cpfile() {
  file="$1"
  dest="$2/$1"
  owner="$3"
  perm="$4"
  cp "$file" "$dest"
  chown "$owner" "$dest"
  chmod "$perm" "$dest"
}

cpfile 90_debian_iso /etc/grub.d root.root 755
wget -c "$iso"

