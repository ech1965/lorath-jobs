#!bin/bash



# Nom du Job
JOB_NAME=${JOB_NAME:-Undef}


function init()
{
    # init repository


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