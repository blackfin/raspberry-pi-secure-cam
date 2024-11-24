#!/usr/bin/env python3

import os
import math
import time
from w1thermsensor import W1ThermSensor
from time import sleep
import re
from datetime import date

cmd = '/usr/bin/ls /sys/bus/w1/devices'
tempCmd = '/usr/bin/vcgencmd measure_temp'
loadCmd = '/usr/bin/cat /proc/loadavg'


sensor = W1ThermSensor()
while True:
    today = date.today()
    temperature = sensor.get_temperature()
    #print("The sensor temperature is %s celsius" % temperature)

    #os.system(tempCmd)
    #f = os.popen(tempCmd)
    #temp = f.read()
    #cpuTemp = re.sub("/[^\d\.]+/s",'',temp)

    #os.system(loadCmd)
    #f = os.popen(loadCmd)
    #loadavg = f.read()
    #loadSplitted = loadavg.split(' ')
    #load  = loadSplitted[0]
    #value = math.floor(float(load) * float(100)/2.2)

    #print("Sensor temp: %s" % temperature)
    #print("CPU load: %s" % value)
    #print("CPU temp: %s" % sanitizedCpuTemp)

    time.sleep(5)
    with open("sensors.txt", "w") as text_file:
        #print(f"{today}\nTemp sensor:{temperature} C\nCPU {cpuTemp} CPU load:{value}\%", file=text_file)
        print(f"{today}\nTemp sensor:{temperature} C", file=text_file)
