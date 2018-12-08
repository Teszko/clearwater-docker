#!/bin/bash

# Henryk Iwaniuk - 08.12.2018
# script to build all clearwater docker images and push them to a local registry.

registry="kubemaster.local:5000"
imagelist="base astaire cassandra chronos bono ellis homer homestead homestead-prov ralf sprout"
#imagelist="sprout"

for i in $imagelist ; do 
    docker build -t clearwater/$i $i;
done

for i in $imagelist
do
    docker tag "clearwater/$i:latest" "$registry/clearwater/$i:latest"
    docker push "$registry/clearwater/$i:latest"
done

