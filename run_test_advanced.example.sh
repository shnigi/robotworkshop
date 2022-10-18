#!/bin/bash

DATE=$(date +"%Y-%m-%d_%H-%M")
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
variable_file="./solutions/variablefile.py"
browser="Chrome"
tests_path="."
tests_tag=""
preserve_results=false

cd $SCRIPT_DIR

function run_robot() {
  robot --variablefile ${variable_file} --variable BROWSER:${browser} --loglevel=INFO \
    ${tests_tag} \
    -d results \
    ${tests_path}
}

function delete_results() {
  if ! $preserve_results ; then
    echo "Removing testresults folder ${SCRIPT_DIR}/results"
    rm -rf results
  fi
}

while getopts "b:f:t:lpv:h" opt; do
  case ${opt} in
    b )
      browser="$OPTARG"
      ;;
    f )
      tests_path="${OPTARG}"
      ;;
    t )
      tests_tag="--i ${OPTARG}"
      ;;
    l )
      echo "Running with variable file"
      variable_file="./solutions/variablefile.py"
      ;;
    p )
      preserve_results=true
      ;;
    v )
      variable_file="$OPTARG"
      ;;
    \? )
      echo "Invalid Option -${OPTARG}" >&2
      exit 1
      ;;
    : )
      echo "Option ${OPTARG} requires an argument" >&2
      ;;
    h|* )
      echo "Usage:"
      echo "-b    Browser. Default used: ${browser}"
      echo "-f    File path for tests. Default is $SCRIPT_DIR"
      echo "-t    Test tag. Default is empty"
      echo "-l    Run tests in local environment"
      echo "-p    Preserve testresults from previous runs."
      echo "-v    Variable file. Default is ${variable_file}. Do not use together with option -l"
      echo "-h    Help"
      exit 0
      ;;
    esac
done

delete_results
run_robot
