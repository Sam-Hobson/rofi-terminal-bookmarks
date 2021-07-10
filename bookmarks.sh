#!/usr/bin/env bash

term=kitty

# REPLACE THIS WITH LOCATION OF "bookmarks" FILE.
pwd="..."

readarray -t file_array < $pwd
print_array=()

# Truncate all directories for display.
for l in ${file_array[@]}; do
  sCount=$(echo $l | awk -F "/" '{ print NF-1 }')
  
  if [ $sCount -lt 3 ]; then
    print_array+=($l)
  else
    print_array+=(".../$(echo $l | cut -d/ -f$(expr $length - 1)-)")
  fi
done

# Ask user for their desired directory.
response=$(printf '%s\n' "${print_array[@]}" | rofi -dmenu -p "Bookmarks")

# Find absolute directory corresponding to requested directory.
for i in ${!print_array[@]}; do
  if [ ${print_array[i]} = $response ]; then
    $term ${file_array[i]} &
    exit
  fi
done
