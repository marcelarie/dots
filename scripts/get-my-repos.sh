#!/usr/bin/env bash

gh repo list --json name --jq '.[].name'
