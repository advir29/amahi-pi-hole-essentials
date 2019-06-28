wget https://raw.githubusercontent.com/advir29/amahi-pi-hole-essentials/setupVars_integrated/hda-ctl
wget https://raw.githubusercontent.com/advir29/amahi-pi-hole/master/automated%20install/basic-install.sh
chmod 755 basic-install.sh
mkdir -p /etc/pihole/
mv /usr/bin/hda-ctl /usr/bin/hda-ctl.orig
cp hda-ctl /usr/bin/hda-ctl
chmod --reference=/usr/bin/hda-ctl.orig /usr/bin/hda-ctl
systemctl restart hda-ctl
sed -i '/DocumentRoot/c\        DocumentRoot /var/hda/web-apps/pihole/html/admin' /etc/httpd/conf.d/*pihole.conf
sed -i '/<Directory/c\        <Directory "/var/hda/web-apps/pihole/html/admin">' /etc/httpd/conf.d/*pihole.conf
rm /etc/dnsmasq.d/amahi*
./basic-install.sh -d /var/hda/web-apps/pihole &