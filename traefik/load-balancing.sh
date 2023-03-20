ip=$(ifconfig eth1 | grep 'inet addr:' | cut -d: -f2 | cut -d' ' -f1)
hostname="ip$(echo $ip | sed "s/\./-/g")-$SESSION_ID"

while true; do
  curl --silent http://$hostname-80.direct.labs.play-with-docker.com/toolbox/env/list | jq '. | "\(.task_name) (\(.node_name))"'
  sleep 0.5
done
