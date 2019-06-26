#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# -e: immediately exit if any command has a non-zero exit status
# -o: prevents errors in a pipeline from being masked
# IFS new value is less likely to cause confusing bugs when looping arrays or arguments (e.g. $@)

usage() { echo "Usage: $0 -d <sourceDatabase>  -m <mergeTargetDB>" 1>&2; exit 1; }

declare subscriptionId=""
declare resourceGroupName=""
declare deploymentName=""
declare resourceGroupLocation=""
declare resourceGroupId=""
declare mongoGroupLocation=""
declare mongoGroupName=""

# Initialize parameters specified from command line
while getopts ":s:d:u:k:m:" arg; do
	case "${arg}" in
		s)
			sourceServer=${OPTARG}
			;;
		d)
			sourceDatabase=${OPTARG}
			;;
		u)
			user=${OPTARG}
			;;
		m)
			mergeTargetDB=${OPTARG}
			;;
		k)
			keyvault=${OPTARG}
			;;
		esac
done
shift $((OPTIND-1))

#Prompt for parameters is some required parameters are missing

if [[ -z "$sourceDatabase" ]]; then
	echo "Enter source database:"
	read sourceDatabase
	[[ "${sourceDatabase:?}" ]]
fi

if [[ -z "$mergeTargetDB" ]]; then
	echo "If creating a *new* resource group, you need to set a location "
	echo "You can lookup locations with the CLI using: az account list-locations "

	echo "Enter resource group location:"
	read resourceGroupLocation
fi

export sourceDatabase=${sourceDatabase}
export mergeTargetDB=${mergeTargetDB}

docker-compose up
docker-compose down