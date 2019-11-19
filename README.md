# docker-terragrunt
Small terragrunt container based on Alpine image (includes Terraform).

Terraform and terragrunt versions specified in Dockerfile ENV variable.

## Default Command
The default command will simply return the version of Terragrunt that is installed in the container. 

For example run:

```
docker run --rm terragrunt
```

To establish the version of Terraform installed, run:

```
docker run --rm terragrunt terraform --version
```
