#!/bin/bash


# Update Satellite Information

wget -qr https://www.celestrak.com/NORAD/elements/weather.txt -O /home/pi/weather/predict/weather.txt
grep "NOAA 15" /home/pi/weather/predict/weather.txt -A 2 > /home/pi/weather/predict/weather.tle
grep "NOAA 18" /home/pi/weather/predict/weather.txt -A 2 >> /home/pi/weather/predict/weather.tle
grep "NOAA 19" /home/pi/weather/predict/weather.txt -A 2 >> /home/pi/weather/predict/weather.tle
grep "METEOR-M 2" /home/pi/weather/predict/weather.txt -A 2 >> /home/pi/weather/predict/weather.tle
# Meteor M N2-2 launch delayed to NET June 2019
# grep "METEOR-N 2" /home/pi/weather/predict/weather.txt -A 2 >> /home/pi/weather/predict/weather.tle

#Remove all AT jobs

for i in `atq | awk '{print $1}'`;do atrm $i;done

#http://phqfh.co.uk/status.htm (check for changes) 02/06/2019
#Schedule Satellite Passes:

/home/pi/weather/predict/schedule_satellite.sh "NOAA 19" 137.1000
/home/pi/weather/predict/schedule_satellite.sh "NOAA 18" 137.9125
/home/pi/weather/predict/schedule_satellite.sh "NOAA 15" 137.6200
/home/pi/weather/predict/schedule_satellite.sh "METEOR-M 2" 137.9000
# Meteor M N2-2 launch delayed to NET June 2019
# /home/pi/weather/predict/schedule_satellite.sh "METEOR-N 2" xxx.xxxx
