BASEDIR=$(dirname "$0")

source $BASEDIR/../common/setup.sh || exit 1

docker stack deploy -c $BASEDIR/traefik.yml traefik
docker stack deploy -c $BASEDIR/application.yml $color

