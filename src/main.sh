#!/bin/bash

function parseInputs {
  # Required inputs
  if [ "${INPUT_MESSAGE}" != "" ]; then
    message=${INPUT_MESSAGE}
  else
    echo "Input message cannot be empty"
    exit 1
  fi

  # Optional inputs
  cow=${INPUT_COW}
}

function installNeoCowsay {
  file="cowsay_v0.1.0_Linux_x86_64.tar.gz"
  url="https://github.com/Code-Hex/Neo-cowsay/releases/download/v0.1.0/${file}"
  echo "Downloading Neo-cowsay"
  curl -s -S -L -o /tmp/${file} ${url}
  if [ "${?}" -ne 0 ]; then
    echo "Failed to download Neo-cowsay"
    exit 1
  fi
  echo "Successfully downloaded Neo-cowsay"

  echo "Unarchiving Neo-cowsay"
  tar -xzf /tmp/${file} -C /usr/local/bin
  if [ "${?}" -ne 0 ]; then
    echo "Failed to unarchiving Neo-cowsay"
    exit 1
  fi
  echo "Successfully unarchiving Neo-cowsay"
}

function main {

  parseInputs
  installNeoCowsay
  ls /usr/local/bin
  ls /tmp
  echo $message
  echo $cow
}

main "${*}"