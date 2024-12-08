#!/usr/bin/env bash
set -e
if [ -z "$BASEDIR" ]; then
  BASEDIR="/home/pi/raspberry-pi-secure-cam"
fi

source "$BASEDIR/launch_env.sh"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

source ~/.venv/bin/activate

python3 temperText.py

