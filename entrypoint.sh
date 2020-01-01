#!/bin/bash

if [ ! -f ~/.pacglobal/pacglobal.conf ]; then
  touch ~/.pacglobal/pacglobal.conf
fi

if ! grep rpcpassword ~/.pacglobal/pacglobal.conf; then
  RPCUSER="pacglobalrpc"
  RPCPASSWORD=$(head /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
  touch ~/.pacglobal/pacglobal.conf
  { echo "rpcuser=${RPCUSER}"; echo "rpcpassword=${RPCPASSWORD}"; echo "printtoconsole=1"; } >> ~/.pacglobal/pacglobal.conf
fi

exec /usr/local/bin/pacglobald "$@"
