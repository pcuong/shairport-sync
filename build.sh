echo "Installing shairport-sync dependencies"
apt-get update
apt-get install -y build-essential git xmltoman autoconf automake libtool libpopt-dev libconfig-dev libasound2-dev avahi-daemon libavahi-client-dev libssl-dev libsoxr-dev checkinstall

echo "Configuring shairport-sync"
autoreconf -fi
./configure --sysconfdir=/etc --with-alsa --with-soxr --with-avahi --with-ssl=openssl --with-systemd --with-dbus-interface

echo "Compiling"
make

echo "Creating Deb"
sudo checkinstall
