#!/usr/bin/env bash

# Store the response from the bitcoin price API in a variable
price_response=$(curl -s "https://api.coindesk.com/v1/bpi/currentprice.json")

# Store the response from the bitcoin price API in a variable
year_price_response=$(curl -s "https://api.coindesk.com/v1/bpi/historical/close.json?start=2022-01-01&end=2022-12-31")

# Parse the bitcoin prices from the API response
prices=$(echo $year_price_response | jq -r '.bpi | to_entries[] | [.key, .value] | join(":")')

# Parse the bitcoin price from the API response
price=$(echo $price_response | jq -r '.bpi.USD.rate')

# Output the bitcoin price
echo "The current bitcoin price is: $price"

# Use the `column` command to output a diagram of the prices
column -s ":" -t <<< "Bitcoin Prices:$prices"
