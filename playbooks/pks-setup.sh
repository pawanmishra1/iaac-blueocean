#!/bin/bash

pks login -a pks.emcdigital.lab -u appmod -p Password@123 -k
pks get-credentials pks-lab-cluster
kubectl config use-context pks-lab-cluster
