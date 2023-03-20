BASEDIR=$(dirname "$0")

source $BASEDIR/../common/setup.sh || exit 1

docker secret inspect traefik-password 2>/dev/null 1>/dev/null || printf "admin" | docker secret create traefik-password - || fail "Could not create traefik secret"

docker stack deploy -c $BASEDIR/traefik.yml traefik

