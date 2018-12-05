size=$1
fallocate -l $size /tmp/swapfile
chmod 600 /tmp/swapfile
mkswap /tmp/swapfile
swapon /tmp/swapfile

