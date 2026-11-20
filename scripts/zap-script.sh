#!/bin/bash
set -eu

report_dir=$(mktemp -d)
chmod 777 "$report_dir"
docker run --rm -v "$report_dir:/zap/wrk:rw" ghcr.io/zaproxy/zaproxy:stable \
  zap-baseline.py -t "https://mohamadmusthafa.github.io/bitcoin-order-app/" \
  -l PASS -I -r zap_baseline_report.html
cp "$report_dir/zap_baseline_report.html" ./zap_baseline_report.html
test -s ./zap_baseline_report.html
