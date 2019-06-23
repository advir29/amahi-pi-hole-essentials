wget https://raw.githubusercontent.com/advir29/amahi-pi-hole-essentials/master/autoGen_setupVars.pl
wget https://raw.githubusercontent.com/advir29/amahi-pi-hole-essentials/master/hda-ctl
wget https://raw.githubusercontent.com/advir29/amahi-pi-hole/master/automated%20install/basic-install.sh
chmod 755 basic-install.sh
chmod 755 autoGen_setupVars.pl
mkdir -p /etc/pihole/
mv /usr/bin/hda-ctl /usr/bin/hda-ctl.orig
cp hda-ctl /usr/bin/hda-ctl
chmod --reference=/usr/bin/hda-ctl.orig /usr/bin/hda-ctl
rm /etc/dnsmasq.d/amahi-*
systemctl stop dnsmasq
systemctl disable dnsmasq
systemctl restart hda-ctl
systemctl stop hda-ctl
sed -i '/nameserver/c\nameserver 8.8.8.8' /etc/resolv.conf
/usr/bin/perl autoGen_setupVars.pl
sed -i '/DocumentRoot/c\        DocumentRoot /var/hda/web-apps/pihole/html/admin' /etc/httpd/conf.d/*pihole.conf
sed -i '/<Directory/c\        <Directory "/var/hda/web-apps/pihole/html/admin">' /etc/httpd/conf.d/*pihole.conf
./basic-install.sh -d /var/hda/web-apps/pihole &