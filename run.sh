#!/bin/sh
./streamLocal.sh > stream.log &
./readTemperature.sh &
