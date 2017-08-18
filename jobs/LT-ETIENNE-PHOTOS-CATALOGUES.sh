#!/bin/bash

. $HOME/jobs/jobs/functions.sh

# Job Specific Variables

# Nom du Job
JOB_NAME=LT-ETIENNE-PHOTOS-CATALOGUES

# URL du stockage
CLOUD_URL=one://_BACKUPS_DO_NOT_TOUCH/DUPLICACY_STORAGE

# Nom du fichier contenant les token
TOKEN_FILE_NAME="one-token-lorath-charlier.info.json"

# Dossier contenant les preferences de duplicacy
PREFS_DIR_NAME=$JOB_NAME

# Dossier source à Backuper
SRC_DIR=/dataperso/LT-ETIENNE-HDD/Catalogues

# Fichier contenant les filtres pour exclure certains fichiers du backup
FILTERS_FILE=$HOME/jobs/jobs/filters


execute $*
