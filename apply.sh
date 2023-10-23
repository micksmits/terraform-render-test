#!/bin/bash

file_name=".env"

if [ ! -f "$file_name" ]; then
  echo "Error: The file '$file_name' was not found."
  exit 1
fi

while read line; do
  variable="${line%=*}"
  value="${line#*=}"
  export "$variable=$value"
done < "$file_name"

rm -rf .terraform .terraform.lock.hcl
terraform init
terraform apply
