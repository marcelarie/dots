#!/bin/sh

case "$INFO" in
  "Finder") sketchybar --bar hidden=on
    ;;
  *) sketchybar --bar hidden=off
esac
