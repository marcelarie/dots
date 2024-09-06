#!/usr/bin/env bash

sudoedit /etc/keyd/default.conf

sudo keyd reload

echo "keyd configuration reloaded"
