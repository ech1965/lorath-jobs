#!/bin/bash

. $HOME/jobs/jobs/functions.sh

# Job Specific Variables

# Nom du Job
JOB_NAME=TEST_BACKUP

# URL du stockage
CLOUD_URL=one://_BACKUPS_DO_NOT_TOUCH/DUPLICACY_STORAGE

# Nom du fichiercontenant les token
TOKEN_FILE_NAME="one-token-lorath-charlier.info.json"
SRC_DIR=/datahome/$JOB_NAME
FILTERS_FILE=$HOME/jobs/filters


execute $*
