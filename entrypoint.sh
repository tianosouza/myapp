#!/bin/bash
set -e
 
# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid
 
# Em seguida, execute o processo principal do contêiner (o que está definido como CMD no Dockerfile).
exec "$@"