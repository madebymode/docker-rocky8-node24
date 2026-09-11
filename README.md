# docker-rocky8-node24

The LTS frontend buildkit for Mode projects. This image is intentionally heavy — it includes everything needed to build frontend assets across all Mode projects.

## Usage

If your local user is not 1000:1000:

```
docker build --build-arg HOST_USER_UID=$(id -u) --build-arg HOST_USER_GID=$(id -g) github.com/madebymode/docker-rocky8-node24.git -t madebymode/node24
```
