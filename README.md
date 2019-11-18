# docker-terragrunt
Dockerfile for terragrunt container (includes Terraform).


## Default Command
The default command will simply return the version of Terragrunt that is installed in the container. 

This is a good way to confirm the correct version has been installed and it's workign as expected.

For example, if the container has been tagged with the Terragrunt version number (0.21.6), then run:

```
docker run --rm terragrunt:0.21.6 
```

To establish the version of Terraform installed, run:

```
docker run --rm terragrunt:0.21.6 terraform --version
```
