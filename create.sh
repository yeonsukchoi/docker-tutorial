#!/bin/bash
SERVICE_NAME="docker-tutorial-service"
TASK_FAMILY="docker-tutorial-task"

aws ecs register-task-definition --family ${TASK_FAMILY} --cli-input-json file:///home/choiyeonsuk/docker/docker-tutorial/docker-tutorial-task-def.json

TASK_REVISION=`aws ecs describe-task-definition --task-definition docker-tutorial-task | egrep "revision" | tr "/" " " | awk '{print $2}' | sed 's/"$//'`
#DESIRED_COUNT=`aws ecs describe-services --cluster docker-tutorial --services ${SERVICE_NAME} | egrep "desiredCount" | tr "/" " " | awk '{print $2}' | sed 's/,$//'`

#if [${DESIRED_COUNT}="0"] ; then
#	DESIRED_COUNT="1"
#fi

aws ecs update-service --cluster docker-tutorial --service ${SERVICE_NAME} --desired-count 1 --task-definition ${TASK_FAMILY}:${TASK_REVISION}
