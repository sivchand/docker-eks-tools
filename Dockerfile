FROM python:3.8

ARG TARGETARCH

ARG KUBECTL_VER=1.23.1
ARG EKSCTL_VER=0.94.0
ARG AWSCLI_VER=2.5.8
ARG IAM_AUTH_VER=0.5.7

# Installing kubectl
RUN curl -sL https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VER}/bin/linux/${TARGETARCH}/kubectl \
    -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl

# Installing eksctl 
RUN curl -sL https://github.com/weaveworks/eksctl/releases/download/v${EKSCTL_VER}/eksctl_Linux_${TARGETARCH}.tar.gz | \
    tar xz -C /usr/local/bin 

# Installing awscli
RUN if [ "$TARGETARCH" = "amd64" ]; then ARCHITECTURE=x86_64; elif [ "$TARGETARCH" = "arm64" ]; then ARCHITECTURE=aarch64; else ARCHITECTURE=x86_64; fi && \
    curl -sL "https://awscli.amazonaws.com/awscli-exe-linux-${ARCHITECTURE}-${AWSCLI_VER}.zip" -o "/tmp/awscliv2.zip" \
    && cd /tmp/ && unzip -q awscliv2.zip && ./aws/install -i /usr/local/aws-cli -b /usr/local/bin 

# Installing aws iam authenticator
RUN curl -sL https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v${IAM_AUTH_VER}/aws-iam-authenticator_${IAM_AUTH_VER}_linux_${TARGETARCH} \
    -o /usr/local/bin/aws-iam-authenticator && chmod +x /usr/local/bin/aws-iam-authenticator
