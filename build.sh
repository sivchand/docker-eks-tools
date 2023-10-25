#!/bin/sh
set -x

KUBECTL_VER=1.27.3
EKSCTL_VER=0.162.0
IAM_AUTH_VER=0.6.11
AWSCLI_VERSION=2.13.26
FLUXCD_VER=0.41.2

docker buildx build --platform=linux/amd64,linux/arm64 --push -t sivchand/eks-tools:eksctl-$EKSCTL_VER -t sivchand/eks-tools:latest --build-arg KUBECTL_VER=$KUBECTL_VER --build-arg EKSCTL_VER=$EKSCTL_VER --build-arg AWSCLI_VERSION=$AWSCLI_VERSION --build-arg IAM_AUTH_VER=$IAM_AUTH_VER --build-arg FLUXCD_VER=$FLUXCD_VER .
