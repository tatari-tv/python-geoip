#!/bin/sh

cd _geoip_geolite2
rm *.mmdb
wget http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz
tar zxf "GeoLite2-City.tar.gz"
mv GeoLite2-City_*/*.mmdb .
rm -rf GeoLite2-City_*
rm GeoLite2-City.tar.gz
cd ..

export PYTHONPATH=`pwd`:`pwd`/..
python -c "if 1:
    from geoip import geolite2;
    info = geolite2.get_info()
    print(info.date.strftime('%Y.%m%d'))
" > VERSION
