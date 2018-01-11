#!/bin/bash

export VERSION=0.10-SNAPSHOT
export RELEASE=$1


git clean -f && git reset --hard origin/master

mvn -DtagNameFormat=${RELEASE} -DreleaseVersion=${RELEASE} -DdevelopmentVersion=${VERSION} -DpushChanges=false -DlocalCheckout=true -DpreparationGoals=initialize -DaltDeploymentRepository=bintray::default::https://api.bintray.com/maven/lorislab/maven/bridj release:prepare release:perform -B 

git push origin $RELEASE

