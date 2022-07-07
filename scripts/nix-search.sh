#!/usr/bin/env sh

nix_config_path="$HOME/.nixpkgs"
search=$(echo $@ | tr '[:upper:]' '[:lower:]')

line_number=$(grep -n "<DISCARDED_PACKAGES>" $nix_config_path/home-manager/home.nix | cut -f1 -d:)
line_before=$(expr $line_number - 2)

[ -z "$search" ] && return 1
[ -z "$line_number" ] && return 1

# NOT USEFUL FOR NOW
# echo "Select a flake:"
# type=$(bash -c 'cat ~/.nixpkgs/flake.nix' | tr '\n' ' ' | tr '-' '_' | rg 'inputs = \{.*?\}' | rg '\w*\.url' -o | sed 's/.url//g' | sed 's/_/-/g' | fzy)

result=$(nix search --json nixpkgs $search | jq -r 'keys[] as $k | "package: \(.[$k] | .pname) ver: \(.[$k] | .version) desc: \(.[$k] | .description)"' | fzy)

package=$(echo $result | rg 'package: \w*' -o | sed 's/package://')

[ -z "$result" ] && return 1
[ -z "$package" ] && return 1

echo "    $package" | sed -i -e "${line_before}r /dev/stdin" $nix_config_path/home-manager/home.nix

cd $nix_config_path
sudo darwin-rebuild switch --flake .#
cd -
