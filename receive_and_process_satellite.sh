#!/bin/bash

# $1 = Satellite Name
# $2 = Frequency
# $3 = FileName base
# $4 = TLE File
# $5 = EPOC start time
# $6 = Time to capture

sudo timeout $6 rtl_fm -f ${2}M -s 60k -g 45 -p 55 -E wav -E deemp -F 9 - | sox -t wav - $3.wav rate 11025

PassStart=`expr $5 + 90`

if [ -e $3.wav ]
then
/usr/local/bin/wxmap -T "${1}" -H $4 -p 0 -l 0 -o $PassStart ${3}-map.png

/usr/local/bin/wxtoimg -m ${3}-map.png -e ZA $3.wav $3.png
/usr/local/bin/wxtoimg -m ${3}-map.png -e NO $3.wav ${3}.NO.png
/usr/local/bin/wxtoimg -m ${3}-map.png -e MCIR $3.wav ${3}.MCIR.png
/usr/local/bin/wxtoimg -m ${3}-map.png -e MSA $3.wav ${3}.MSA.png

sleep 60

    /home/pi/weathertweeter/weathertweeter.py ${3}.png ${3}

# Delete old satellite image files from www directory
sudo rm /var/www/html/NOAA/*.*

# Copy, rename current files to www directory
sudo cp /home/pi/weather/NOAA*.png /var/www/html/NOAA/current.png
sudo cp /home/pi/weather/NOAA*.NO.png /var/www/html/NOAA/current.NO.png
sudo cp /home/pi/weather/NOAA*.MCIR.png /var/www/html/NOAA/current.MCIR.png
sudo cp /home/pi/weather/NOAA*.MSA.png /var/www/html/NOAA/current.MSA.png

# Delete old .png and .wav files from weather directory
sudo rm /home/pi/weather/*.png
sudo rm /home/pi/weather/*.wav

fi
