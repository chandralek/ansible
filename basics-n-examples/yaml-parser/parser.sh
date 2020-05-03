#!/bin/bash

YAML_FILE=yaml-parser.yaml

NUMBER_OF_STUDENTS=$(cat $YAML_FILE| yq . | jq '.STUDENT_LIST|length')
COURSE_NAME=$(cat details.yaml | yq . | jq '.COURSE_NAME')
TIMING=$(cat details.yaml | yq . | jq '.COURSE_TIMING')

i=0
while [ $NUMBER_OF_STUDENTS -gt 0 ]; do
  NAME=$(cat $YAML_FILE| yq . | jq ".STUDENT_LIST[$i].name")
  echo "<EAMIL: Sent-to: <$(cat $YAML_FILE| yq . | jq ".STUDENT_LIST[$i].email")>>"
  echo -e "Hi $NAME, Course $COURSE_NAME is getting started from 2019-02-29 @ $TIMING, Reach out to following number if you are intrested.\n Regards INST"
  i=$(($i+1))
  NUMBER_OF_STUDENTS=$(($NUMBER_OF_STUDENTS-1))
done
