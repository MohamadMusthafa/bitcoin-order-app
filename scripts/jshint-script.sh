#!/bin/bash

# JSHint exits with 2 when it records findings in the report.
status=0
jshint --exclude="node_modules/" --reporter=unix . > JSHint-report || status=$?
if [ "$status" -eq 2 ]; then
  exit 0
fi
exit "$status"
