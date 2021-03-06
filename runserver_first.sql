#! /bin/bash
#
# File: runserver
#
# Purpose: Runs the MySQL server in a Docker container
#
# NB: Uses a Docker volume named mysql_data to contain database data
#

export MYSQL_IMAGE=mysql
export MYSQL_VERSION=5.7
export ROOT_PASSWORD=rootpw
export STUDENT_USER=student
export STUDENT_PASSWORD=student
export STUDENT_DATABASE=monitoring
export MYSQL_SERVER_CONTAINER_NAME=mysql
export MYSQL_SERVER_EXTERNAL_PORT=3306
export MYSQL_SERVER_INTERNAL_PORT=3306

docker rm -f mysql

docker run -d \
  --name mysql \
  -p $MYSQL_SERVER_EXTERNAL_PORT:$MYSQL_SERVER_INTERNAL_PORT \
  -e MYSQL_DATABASE=$STUDENT_DATABASE \
  -e MYSQL_USER=$STUDENT_USER \
  -e MYSQL_PASSWORD=$STUDENT_PASSWORD \
  -e MYSQL_ROOT_PASSWORD=$ROOT_PASSWORD \
  -v monitoring_data:/var/lib/mysql \
  ${MYSQL_IMAGE}:${MYSQL_VERSION}
docker ps