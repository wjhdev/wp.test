# provision.sh
#
# Boot script for newly provisioned server. Bundled with vagrant
# to set up local development environment

#!/bin/bash

# Set the timezone
echo "US/Central" > /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

# make sure our clocks are always on time
echo 'ntpdate ntp.ubuntu.com' > /etc/cron.daily/ntpdate
chmod +x /etc/cron.daily/ntpdate

# Install Puppet
apt-get update -y
apt-get install -y puppet

echo "PATH=$PATH:/usr/local/bin/vendor/bin/" >> /home/vagrant/.bashrc

echo 'Finished provision.sh'

