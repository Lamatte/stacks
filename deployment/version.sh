while true; do
  curl -w " - HTTP/%{http_version} %{response_code}\n" "http://localhosti:8080/toolbox/git/version"
  sleep 1
done
