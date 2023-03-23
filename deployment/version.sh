while true; do
  curl -w " - HTTP/%{http_version} %{response_code}\n" "http://localhost/toolbox/git/version"
  sleep 1
done
