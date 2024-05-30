#!/usr/bin/env bash

for file in ./*.pdf; do
	echo "Decrypted $file"
	no_extension_name=$(basename "$file" .pdf)
	qpdf --decrypt --password="$PDF_PASSWORD" "$file" "$no_extension_name-decrypted.pdf"
done
