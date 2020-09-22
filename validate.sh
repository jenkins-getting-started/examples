#!/usr/bin/env bash

# -ns bypasses sandboxing issues with script approval blocks
docker container run \
  --rm -it \
  -v "${PWD}:/workspace" \
  jenkins4eval/jenkinsfile-runner \
  -ns