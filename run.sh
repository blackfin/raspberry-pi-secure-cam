#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

"$DIR"/streamLocal.sh &
"$DIR"/readTemperature.sh &
#"$DIR"/dumpToFile.sh &
