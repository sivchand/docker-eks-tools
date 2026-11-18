#!/bin/sh
set -x

EKSCTL_VER=0.231.0
IAM_AUTH_VER=0.7.24
AWSCLI_VERSION=2.40.4
FLUXCD_VER=2.5.0
KAPP_VER=0.66.2

for KUBECTL_VER in $(echo 1.35.9 1.36.5 1.37.1)
do
docker buildx build --platform=linux/amd64,linux/arm64 --push -t sivchand/eks-tools:eksctl-${EKSCTL_VER%.*}-kubectl-${KUBECTL_VER%.*}-fluxcd-${FLUXCD_VER%.*}  --build-arg KUBECTL_VER=$KUBECTL_VER --build-arg EKSCTL_VER=$EKSCTL_VER --build-arg AWSCLI_VERSION=$AWSCLI_VERSION --build-arg IAM_AUTH_VER=$IAM_AUTH_VER --build-arg FLUXCD_VER=$FLUXCD_VER --build-arg KAPP_VER=$KAPP_VER .
done

docker buildx build --platform=linux/amd64,linux/arm64 --push -t sivchand/eks-tools:latest  --build-arg KUBECTL_VER=$KUBECTL_VER --build-arg EKSCTL_VER=$EKSCTL_VER --build-arg AWSCLI_VERSION=$AWSCLI_VERSION --build-arg IAM_AUTH_VER=$IAM_AUTH_VER --build-arg FLUXCD_VER=$FLUXCD_VER --build-arg KAPP_VER=$KAPP_VER .
