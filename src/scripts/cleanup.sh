#!/bin/bash
#
# -----------------------------------------------------------------------------
#
# A simple script to a base image
#
# -----------------------------------------------------------------------------
#
# The MIT License (MIT)
#
# Copyright (c) 2015 Werner Strydom
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# -----------------------------------------------------------------------------

# --- Body --------------------------------------------------------------------

echo ""
echo ""
echo ""
echo "-----------------------------------------------------------------------------"
echo " Cleaning Up"
echo "-----------------------------------------------------------------------------"

# package cleanup
apt-get -y autoremove
apt-get -y clean

# Stop auditing services
service auditd stop
service rsyslog stop

# Rote all logs
logrotate –f /etc/logrotate.conf
find /var/log -name "*.gz" -type f -delete

# Truncate Log Files
cat /dev/null > /var/log/audit/audit.log
cat /dev/null > /var/log/wtmp
cat /dev/null > /var/log/lastlog

# cleaning up udev rules
rm -f /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm -f /lib/udev/rules.d/75-persistent-net-generator.rules

# cleaning up temporary files
rm -rf /tmp/*
rm -rf /var/tmp/*

# cleaning up ssh
rm -f /etc/ssh/*host*
rm –rf /etc/ssh/*key*
rm –rf ~/.ssh/authorized_keys

# remove hostname
cat /dev/null > /etc/hostname

# remove history
history -w
history -c


# remove DHCP leases
rm -f /var/lib/dhcp*/*leases*
