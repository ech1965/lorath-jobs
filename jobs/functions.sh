#!/bin/bash


# Directory containing all pref-dirs
PREF_DIR="/pref-dirs"
# Directory containing OneDrive Token Files
TOKEN_DIR="/config/tokens"





function init()
{
    pushd $SRC_DIR
    # init repository
    duplicacy init -pref-dir $PREF_DIR/$JOB_NAME $JOB_NAME $CLOUD_URL

    # save reference to token file
    duplicacy set -key one_token -value $TOKEN_DIR/$TOKEN_FILE_NAME

    #install filters
    cp $HOME/jobs/jobs/filters $PREF_DIR/$JOB_NAME/
    popd
}

function backup()
{
    set -x
    pushd $SRC_DIR
    # backup repository
    duplicacy backup

    popd
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

    if [ "z$ACTION" == "zbackup" ]
    then
        init $ARGS
        echo "Backup repository"
    fi

}