#!/bin/sh

if [ ! -f ~/.PACGlobal/pacglobal.conf ]; then
  touch ~/.PACGlobal/pacglobal.conf
fi

if ! grep rpcpassword ~/.PACGlobal/pacglobal.conf; then
  RPCUSER="pacglobalrpc"
  RPCPASSWORD=$(head /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
  IP="63.32.112.230"
  BLSPRIVKEY="08304df637ec917d0e5843580239496cedce73830ac831701edad2bfd57757e6"
  touch ~/.PACGlobal/pacglobal.conf
  { echo "rpcuser=${RPCUSER}"; \
  echo "rpcpassword=${RPCPASSWORD}"; \
  echo "rpcallowip=127.0.0.1"; \
  echo "rpcport=7111"; \
  echo "listen=1"; \
  echo "server=1"; \
  echo "daemon=1"; \
  echo "maxconnections=128"; \
  echo "masternode=1"; \
  echo "masternodeblsprivkey=${BLSPRIVKEY}"; \
  echo "externalip=${IP}"; \
  } >> ~/.PACGlobal/pacglobal.conf
fi

exec /usr/local/bin/pacglobald
