#!/usr/bin/env bash

shopt -s dotglob

find * -prune -type d | while IFS= read -r d; do
    printf "\nCurrent directory is: $d\n\n"
    cd $d

    if [ -a values.yaml ]
      then
	      yq write values.yaml 'imagestore.(registry==*).registry' gwicapcontainerregistry.azurecr.io/ -i
    fi

    cd ..
done
