# Original command:
# mann_turb_x64.exe test 1.0 29.4 3.0 1209 256 32 32 2.0 5 5 true

docker run -v "$(pwd):/tmp/mann_calc" --rm -t mann:2014 /opt/mann_turb_x64/mann_turb_x64.sh test 1.0 29.4 3.0 1209 256 32 32 2.0 5 5 true
