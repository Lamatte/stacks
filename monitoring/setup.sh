BASEDIR=$(dirname "$0")

source $BASEDIR/../common/setup.sh || exit 1

docker secret inspect grafana-password 2>/dev/null 1>/dev/null || printf "admin" | docker secret create grafana-password - || fail "Could not create grafana secret"

ip=$(ifconfig eth1 | grep 'inet addr:' | cut -d: -f2 | cut -d' ' -f1)
export grafana_root_url="http://ip$(echo $ip | sed "s/\./-/g")-$SESSION_ID-3000.direct.labs.play-with-docker.com"
echo $grafana_root_url

docker stack deploy -c $BASEDIR/monitoring.yml monitoring

