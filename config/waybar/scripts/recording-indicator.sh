#!/bin/bash
if [[ -f /tmp/island-recording-pid ]] && kill -0 "$(cat /tmp/island-recording-pid)" 2>/dev/null; then
  echo '{"text": "󰻂", "tooltip": "Recording — click to stop", "class": "active"}'
else
  echo '{"text": ""}'
fi
