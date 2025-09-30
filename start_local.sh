#!/bin/bash

# Set the base directory
base_dir="$(pwd)/aoame"

# Change directory and start fuseki server
git_name=fuseki-heroku-test
cd "$base_dir/$git_name"
echo "### STARTING fuseki-server.sh ###"
sh -x fuseki-server.sh &
echo "### fuseki-server.sh STARTED ###"

# Change directory and start web server for web service
git_name=OntologyBasedModellingEnvironment-WebService
cd "$base_dir/$git_name"
echo "### STARTING start_webserver.sh ###"
sh -x start_webserver.sh &
echo "### start_webserver.sh STARTED ###"

# Change directory and start server for web app
git_name=OntologyBasedModellingEnvironment-WebApp
cd "$base_dir/$git_name"
export NODE_OPTIONS=--openssl-legacy-provider
ng build
echo "### ng build DONE ###"
node server.js
echo "### node server.js DONE ###"