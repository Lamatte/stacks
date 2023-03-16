fail() {
  echo $* >&2
  exit 1
}

for network in "clusternetwork" "monitornetwork"; do
  echo "Creating network $network..."
  docker network inspect "$network" 2>/dev/null 1>/dev/null || docker network create --driver overlay --opt encrypted --attachable $network || fail "Failed to create network $network"
done

