#!/bin/bash


# Directory containing all pref-dirs
PREF_DIR="/pref-dirs"
# Directory containing OneDrive Token Files
TOKEN_DIR="/config/tokens"





function init()
{
    # init repository
    duplicacy init -pref-dir $PREF_DIR/$JOB_NAME $JOB_NAME $CLOUD_URL

}

function execute()
{
    ACTION="$1"
    shift
    ARGS=$*

    if [ "z$ACTION" == "zinit" ]
    then
        init $ARGS
        echo "Init repository"
    fi
}