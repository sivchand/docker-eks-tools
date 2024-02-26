#!/bin/sh
set -x

KUBECTL_VER=1.27.3
EKSCTL_VER=0.172.0
IAM_AUTH_VER=0.6.14
AWSCLI_VERSION=2.13.26
FLUXCD_VER=2.2.3

for KUBECTL_VER in $(echo 1.29.2 1.28.7 1.27.11 1.26.14)
do
docker buildx build --platform=linux/amd64,linux/arm64 --push -t sivchand/eks-tools:eksctl-$EKSCTL_VER-kubectl-$KUBECTL_VER-fluxcd-$FLUXCD_VER  --build-arg KUBECTL_VER=$KUBECTL_VER --build-arg EKSCTL_VER=$EKSCTL_VER --build-arg AWSCLI_VERSION=$AWSCLI_VERSION --build-arg IAM_AUTH_VER=$IAM_AUTH_VER --build-arg FLUXCD_VER=$FLUXCD_VER .
done
