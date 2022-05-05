#!/bin/bash

function createUser() {
        # 1. create iam user
        export IAM_USERNAME="$(aws iam create-user --user-name "$IAM_USER_NAME" --output text --query 'User.UserName')"
        # 2. create iam user ak/sk
        export IAM_AK_SK="$(aws iam create-access-key --user-name $IAM_USERNAME --output json)"
        export IAM_ACCESSKEY="$(echo $IAM_AK_SK | jq -r '.AccessKey.AccessKeyId')"
        export IAM_SECRETKEY="$(echo $IAM_AK_SK | jq -r '.AccessKey.SecretAccessKey')"
        # 4. output iam user name,ak,sk,region
        echo -e "IAM User Name:\t$IAM_USERNAME\n"
}

export DATE_NOW="$(date +%d%m%y%H%M%S)"
export IAM_USER_NAME=interview-cfn-"$DATE_NOW"
export IAM_GROUP="ansible"
createUser
