#!/bin/bash

which minishift
if [ $? -gt 0 ]
then
  echo "Please install minishift"
  echo "https://docs.openshift.org/latest/minishift/getting-started/installing.html#installing-instructions"
  exit
fi
eval $(minishift oc-env)

minishift status | grep Running
if [ $? -gt 0 ]
then
  minishift start
fi

oc get projects | grep dds
if [ $? -gt 0 ]
then
  oc new-project dds
fi

oc project dds
oc get templates/privileged-container-template
if [ $? -gt 0 ]
then
  oc create -f minishift/privileged-container-template.yml
fi
oc get serviceaccounts | grep localroot
if [ $? -gt 0 ]
then
  oc create serviceaccount localroot
  oc login -u system:admin
  oc adm policy add-scc-to-user anyuid -z localroot
  oc login -u developer
fi

oc get svc/swift
if [ $? -gt 0 ]
then
  oc new-app -l name=swift --param=NAME=swift --param=DOCKER_IMAGE=morrisjobke/docker-swift-onlyone --param=PRIVILEGED_SERVICE_ACCOUNT=localroot privileged-container-template
  sleep 10
  oc create -f minishift/swift.svc
  oc expose -l name=swift svc/swift
fi

oc get svc/neo4j
if [ $? -gt 0 ]
then
  oc new-app -l name=neo4j -e NEO4J_AUTH=none --param=NAME=neo4j --param=DOCKER_IMAGE=neo4j:3.0.2 --param=PRIVILEGED_SERVICE_ACCOUNT=localroot privileged-container-template
  sleep 10
  oc create -f minishift/neo4j.svc
  oc expose -l name=neo4j svc/neo4j
fi

oc get svc/rabbitmq
if [ $? -gt 0 ]
then
  oc new-app -l name=rabbitmq --param=NAME=rabbitmq --param=DOCKER_IMAGE=rabbitmq:3.5-management --param=PRIVILEGED_SERVICE_ACCOUNT=localroot privileged-container-template
  sleep 10
  oc create -f minishift/rabbitmq.svc
  oc expose -l name=rabbitmq svc/rabbitmq
fi
