#!/bin/bash

# Set the base directory
base_dir="$(pwd)/aoame"

# Change directory and start fuseki server
git_name=fuseki-heroku-test
cd "$base_dir/$git_name"
sh -x fuseki-server.sh &

# Change directory and start web server for web service
git_name=OntologyBasedModellingEnvironment-WebService
cd "$base_dir/$git_name"
sh -x start_webserver.sh &

# Change directory and start server for web app
git_name=OntologyBasedModellingEnvironment-WebApp
cd "$base_dir/$git_name"
node server.js

#!/bin/bash

# Set the base directory
base_dir="$(pwd)/aoame"

# Change directory and start fuseki server
git_name=fuseki-heroku-test
cd "$base_dir/$git_name"
sh -x fuseki-server.sh &

# Change directory and start web server for web service
git_name=OntologyBasedModellingEnvironment-WebService
cd "$base_dir/$git_name"
sh -x start_webserver.sh &

# Set trap to stop all child processes when this script receives SIGINT, SIGTERM, or EXIT signals
trap 'pkill -P $$' SIGINT SIGTERM EXIT

# Change directory and start server for web app
git_name=OntologyBasedModellingEnvironment-WebApp
cd "$base_dir/$git_name"
node server.js &