chmod 4755 /usr/bin/sudo
usermod -l FsDistro -d /home/FsDistro -m firos
echo "FsDistro:fsdistro" | sudo chpasswd
rm final.sh
