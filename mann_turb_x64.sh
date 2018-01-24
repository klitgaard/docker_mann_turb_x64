#!/bin/bash

# mann_turb_x64.exe test 1.0 29.4 3.0 1209 256 32 32 2.0 5 5 true

# Start wineserver64
/usr/lib/wine/wineserver64

# cd to calculation folder
cd /tmp/mann_calc

# Run mann_turb_x64.exe with wine64
/usr/lib/wine/wine64 /opt/mann_turb_x64/mann_turb_x64.exe $@ 2>/dev/null
