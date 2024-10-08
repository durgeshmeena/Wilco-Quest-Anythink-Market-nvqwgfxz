#!/bin/bash

if [[ -z $1 ]]; then
    echo "Please provide file path"
    exit 1;
else
    FILE_NAME=$1
fi 

cat $FILE_NAME |
    while read l;do 
        first_name=$(echo "$l" | grep -i "@amazon.com" | awk -F',' '{print $3 " " $2}' ); 
        if [[ $first_name ]]; then 
            echo "$first_name" >> output_names.txt; 
        fi; 
    done;

