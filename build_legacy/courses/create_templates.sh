#!/bin/bash

## 20220109 creates the templates for a course
## uses a CSV file as the point of departure and creates a set of
## template files in as many languages as records in the file

## Parameters
DEST_FOLDER=$1
SETUP_FOLDER=$2
SETUP_FILE=$3

DATA_FILE="${SETUP_FOLDER}/${SETUP_FILE}"
SEPARATOR='¤'
PAGES_FOLDER="pages"    ## was "exercises"

[ ! -f $DATA_FILE ] && { echo "$DATA_FILE file not found"; exit 99; }

OFS=$IFS
IFS=SEPARATOR

## Create the folder for the templates if it doesn't exist
[ ! -d "${DEST_FOLDER}" ] && mkdir ${DEST_FOLDER}
[ ! -d "${DEST_FOLDER}/templates" ] && mkdir "${DEST_FOLDER}/templates"
[ ! -d "${DEST_FOLDER}/templates/${PAGES_FOLDER}" ] && mkdir "${DEST_FOLDER}/templates/${PAGES_FOLDER}"

## Read all fields in a record as an array
while read -ra array; do

    ## Create the folder for the locale, which is the first field
    [ ! -d "${DEST_FOLDER}/templates/${PAGES_FOLDER}/${array[0]}" ] && mkdir "${DEST_FOLDER}/templates/${PAGES_FOLDER}/${array[0]}"

    ## Create the template file
    echo -e "** CREATE TEMPLATE FOR LOCALE: ${array[0]} ** \n"
    TEMPLATE_FILE="${DEST_FOLDER}/templates/${PAGES_FOLDER}/${array[0]}/template_${array[1]}.md"
    ##echo "" > $TEMPLATE_FILE

    for i in "${!array[@]}"
    do :
        if [ "$i" -gt 1 ]; then
            echo "${array[$i]}" >> $TEMPLATE_FILE
            echo "" >> $TEMPLATE_FILE
        else
            >$TEMPLATE_FILE
        fi
    done

done < $DATA_FILE

## Done
echo -e "** Done generating templates"