#!/bin/bash

NOW=$(date "+%Y%m%d-%H-%M-%S")

REPORTS=/reports
# Directory containing all pref-dirs
PREFS_DIR="/pref-dirs"
# Directory containing OneDrive Token Files
TOKEN_DIR="/config/tokens"

#-------- variables qui doivent être initialisées dans le job
# Nom du Job
#---JOB_NAME=LT-ETIENNE-PHOTOS-CATALOGUES

# URL du stockage
#---CLOUD_URL=one://_BACKUPS_DO_NOT_TOUCH/DUPLICACY_STORAGE

# Nom du fichier contenant les token
#---TOKEN_FILE_NAME="one-token-lorath-charlier.info.json"

# Dossier contenant les preferences de duplicacy
#---PREFS_DIR_NAME=$JOB_NAME

# Dossier source à Backuper
#---SRC_DIR=/dataperso/LT-ETIENNE-HDD/Catalogues

# Fichier contenant les filtres pour exclure certains fichiers du backup
#---FILTERS_FILE=$HOME/jobs/jobs/filters



function init()
{
    pushd $SRC_DIR
    # init repository
    duplicacy init -pref-dir $PREFS_DIR/$PREFS_DIR_NAME $JOB_NAME $CLOUD_URL

    # save reference to token file
    duplicacy set -key one_token -value $TOKEN_DIR/$TOKEN_FILE_NAME

    #install filters
    cp $HOME/jobs/jobs/filters $PREFS_DIR/$PREFS_DIR_NAME/
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


function restore()
{
    set -x
    pushd $SRC_DIR
    # backup repository
    duplicacy restore  $*

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
        backup $ARGS
        echo "Backup repository"
    fi

    if [ "z$ACTION" == "zrestore" ]
    then
        restore $ARGS
        echo "Backup repository"
    fi

}

