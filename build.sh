#!/bin/sh
set -x

EKSCTL_VER=0.204.0
IAM_AUTH_VER=0.6.30
AWSCLI_VERSION=2.24.10
FLUXCD_VER=2.5.0

for KUBECTL_VER in $(echo 1.29.12 1.30.10 1.31.6 1.32.2)
do
docker buildx build --platform=linux/amd64,linux/arm64 --push -t sivchand/eks-tools:eksctl-${EKSCTL_VER%.*}-kubectl-${KUBECTL_VER%.*}-fluxcd-${FLUXCD_VER%.*}  --build-arg KUBECTL_VER=$KUBECTL_VER --build-arg EKSCTL_VER=$EKSCTL_VER --build-arg AWSCLI_VERSION=$AWSCLI_VERSION --build-arg IAM_AUTH_VER=$IAM_AUTH_VER --build-arg FLUXCD_VER=$FLUXCD_VER .
done

docker buildx build --platform=linux/amd64,linux/arm64 --push -t sivchand/eks-tools:latest  --build-arg KUBECTL_VER=$KUBECTL_VER --build-arg EKSCTL_VER=$EKSCTL_VER --build-arg AWSCLI_VERSION=$AWSCLI_VERSION --build-arg IAM_AUTH_VER=$IAM_AUTH_VER --build-arg FLUXCD_VER=$FLUXCD_VER .
