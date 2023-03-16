for network in "clusternetwork" "monitornetwork"; do
  echo "Removing network $network..."
  docker network rm $network
done

