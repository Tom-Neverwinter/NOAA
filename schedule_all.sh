#!/bin/bash


# Update Satellite Information

# wget -qr https://www.space-track.org/basicspacedata/query/class/tle_latest/ORDINAL/1/NORAD_CAT_ID/24753,25338,25991,27509,28054,28654,28912,28937,29047,29048,29049,29050,29051,29052,29155,29499,29522,32958,33463,33591,35491,35865,35951,36411,36744,37214,37849,38049,38552,38771,39260,40069,40267,40367,40732,41105,41836,41866,41882,41884,41885,41886,41887,41888,41889,41890,41891,43010,43013,43226,43491,43689,43823,44387/orderby/NORAD_CAT_ID/predicates/OBJECT_NAME,TLE_LINE1,TLE_LINE2/format/3le -O /home/pi/weather/predict/weather.txt
wget -qr https://www.celestrak.com/NORAD/elements/weather.txt -O /home/pi/weather/predict/weather.txt
grep "NOAA 15" /home/pi/weather/predict/weather.txt -A 2 > /home/pi/weather/predict/weather.tle
grep "NOAA 18" /home/pi/weather/predict/weather.txt -A 2 >> /home/pi/weather/predict/weather.tle
grep "NOAA 19" /home/pi/weather/predict/weather.txt -A 2 >> /home/pi/weather/predict/weather.tle
#grep "Metop-A" /home/pi/weather/predict/weather.txt -A 2 >> /home/pi/weather/predict/weather.tle
grep "METEOR-M 2" /home/pi/weather/predict/weather.txt -A 2 >> /home/pi/weather/predict/weather.tle
grep "METEOR-N 2" /home/pi/weather/predict/weather.txt -A 2 >> /home/pi/weather/predict/weather.tle

#Remove all AT jobs

for i in `atq | awk '{print $1}'`;do atrm $i;done

#http://phqfh.co.uk/status.htm (check for changes) Updated: 10/13/2019
#Schedule Satellite Passes:

/home/pi/weather/predict/schedule_satellite.sh "NOAA 15" 137.6200
/home/pi/weather/predict/schedule_satellite.sh "NOAA 18" 137.9125
/home/pi/weather/predict/schedule_satellite.sh "NOAA 19" 137.1000
#/home/pi/weather/predict/schedule_satellite.sh "Metop-A" 137.1000
#/home/pi/weather/predict/schedule_satellite.sh "Metop-B"
#/home/pi/weather/predict/schedule_satellite.sh "Metop-C"
/home/pi/weather/predict/schedule_satellite.sh "METEOR-M 2" 137.1000
/home/pi/weather/predict/schedule_satellite.sh "METEOR-N 2" 137.9000
