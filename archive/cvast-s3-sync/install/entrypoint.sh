#!/bin/bash

INTERVAL=${INTERVAL:-1}
TIMEOUT=${TIMEOUT:-30}
LOCAL_PATH="${LOCAL_PATH}"

if [[ -z ${AWS_ACCESS_KEY_ID} ]] || [[ -z ${AWS_SECRET_ACCESS_KEY} ]] || [[ -z ${AWS_DEFAULT_REGION} ]] || [[ -z ${S3_PATH} ]] || [[ -z ${LOCAL_PATH} ]]; then
	echo "Set all required environment variables: "
	echo "	ACCESS_KEY"
	echo "	SECRET_KEY"
	echo "	AWS_DEFAULT_REGION"
	echo "	S3_PATH" 
	echo "	LOCAL_PATH" 
	echo "" 
	echo "Exiting..."
	exit 1
fi

	
COUNTER=0
while [[ ${COUNTER} != ${TIMEOUT}; do
	aws s3 sync ${LOCAL_PATH} ${S3_PATH}
	aws s3 sync ${S3_PATH} ${LOCAL_PATH}
	sleep ${INTERVAL}
	${COUNTER} += ${INTERVAL}
done