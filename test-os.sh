#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo Linux
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo Mac
else
  echo "Neither linux nor mac"
fi

