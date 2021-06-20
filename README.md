# raspberry-pi-secure-cam

# Raspberry pi settings

Download OS for raspberry pi from https://www.raspberrypi.org/software/operating-systems/#raspberry-pi-os-32-bit
Write flash drive: sudo dd if=Raspberry.iso of=/dev/sdb status=progress
Connect raspberry to external monitor throught HDMI
Default login: pi password: raspberry
Connect to WiFi, enable 1-Wire, camera. Next expand flash size: Advanced Options» -> «A1 Expand Filesystem».
Reboot.

# Nginx setup
Use Ubuntu or some ubuntu flawor. First remove apache sudo apt remove apache2
and then install nginx sudo apt install nginx
Backup nginx and build it from source for support streaming
sudo mv /usr/sbin/nginx /usr/sbin/nginx.old

# Install support packages:

sudo apt-get install libpcre3 libpcre3-dev libssl-dev

# Get nginx source, extract it:

wget http://nginx.org/download/nginx-1.17.8.tar.gz

# Download rtmp-module, extract:

wget https://github.com/arut/nginx-rtmp-module/zipball/master -O nginx-rtmp-module-master.zip
unzip nginx-rtmp-module-master.zip -d nginx-rtmp-module-master

# Go to nginx sources, run this:

cd nginx
./configure --prefix=/usr --add-module=../nginx-rtmp-module-master/ \
--pid-path=/var/run/nginx.pid --conf-path=/etc/nginx/nginx.conf \
--error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log \
--with-http_ssl_module

# lets make it

make

sudo make install

sudo cp ../nginx-rtmp-module-master/stat.xsl /etc/nginx/

# Run it

sudo service nginx start

# Edit config, add streaming section name - streamer, enable HLS. The stream accessed thru /tmp
sudo vim /etc/nginx/nginx.conf

user www-data;
worker_processes auto;
pid /run/nginx.pid;

rtmp_auto_push on;

rtmp {
    record all;
    live on;
    server {
        listen 1935;
        application streamer {
            hls on;
            hls_path /tmp/hls;
            hls_fragment 5s;
        }
    }
}

[...]

# Enable access to /tmp for browser
Edit /etc/nginx/sites-enabled/default.conf and add 

> server {

> listen 80;
>    listen [::]:80 ipv6only=on default_server;
>    server_name localhost;
>    index index.html index.htm index.php;

>    location /hls {
>        root /tmp;
>    }

> [...]
