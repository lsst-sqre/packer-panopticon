sed -i.bak \
    -e 's/^#PermitRootLogin yes/PermitRootLogin yes/' \
    -e 's/^#PermitEmptyPasswords yes/PermitEmptyPasswords no/' \
    -e 's/PermitEmptyPasswords yes/PermitEmptyPasswords no/' \
    -e 's/^#PasswordAuthentication yes/PasswordAuthentication no/' \
    -e 's/PasswordAuthentication yes/PasswordAuthentication no/' \
    -e 's/^#X11Forwarding yes/X11Forwarding no/' \
    -e 's/X11Forwarding yes/X11Forwarding no/' \
    /etc/ssh/sshd_config
