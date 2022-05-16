#!/bin/bash

aws iam wait user-exists --user-name $IAM_USERNAME
if [[ $? == 255 ]]; then
  echo "User $IAM_USERNAME doesn't exist. Available Users are :"
  aws iam list-users | jq -r '.Users[].UserName'
fi
