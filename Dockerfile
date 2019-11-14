FROM debian:stable-slim as build

RUN set -eux \
        && DEBIAN_FRONTEND=noninteractive apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends --no-install-suggests \
		        ca-certificates \
                curl \
                git \
                unzip

ENV TF_VERSION=0.12.14
ENV TG_VERSION=v0.21.5
# Get Terraform
RUN curl -sS -L -O https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip \
	&& unzip terraform_${TF_VERSION}_linux_amd64.zip \
	&& mv terraform /usr/bin/terraform \
	&& chmod +x /usr/bin/terraform

# Get Terragrunt
RUN curl -sS -L \
        https://github.com/gruntwork-io/terragrunt/releases/download/${TG_VERSION}/terragrunt_linux_amd64 \
		-o /usr/bin/terragrunt \
	&& chmod +x /usr/bin/terragrunt

# Build a tiny image
FROM alpine:3.10
LABEL \
	maintainer="Andrew Clure" \
	repo="https://github.com/"

COPY --from=build /usr/bin/terraform /usr/bin/terraform
COPY --from=build /usr/bin/terragrunt /usr/bin/terragrunt

WORKDIR /data

CMD ["terragrunt", "--version"]

