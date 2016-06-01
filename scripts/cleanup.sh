#!/bin/sh -eux

rm -rf /etc/udev/rules.d/70-persistent-net.rules;

# cleanup centos user account (if it exists)
if id -u ubuntu > /dev/null 2>&1; then
    /usr/sbin/userdel -rf ubuntu
fi

# cleanup any ssh keys nova/cloud-init may have injected
rm -rf /root/.ssh
find  /home/ -maxdepth 2 -type d -name .ssh -exec rm -rf {} \;

# per https://aws.amazon.com/articles/0155828273219400
find /root/.*history /home/*/.*history -print0 | xargs -0 rm -f || true
find /home/*/.ssh -name "authorized_keys" -print0 | xargs -0 rm -f || true
