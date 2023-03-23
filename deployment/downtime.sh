while true; do
  # Here we force a long-running server-side request, in order to make sure the server is handling
  # graceful shutdowns properly.
  curl -w " - HTTP/%{http_version} %{response_code}\n" "http://localhost/toolbox/sleep/10000?echo=$(date -Iseconds)" &
  sleep 0.2
done
