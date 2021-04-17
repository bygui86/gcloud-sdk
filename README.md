
# gcloud sdk

Small container image with only `gcloud sdk` installed

## Build

```bash
make container-build CONTAINER_TAG=dev
```

## Push

```bash
make container-push CONTAINER_TAG=dev
```

## Run

```bash
make container-run CONTAINER_TAG=dev
```

## Exec

```bash
make container-exec
```

## Stop

```bash
make container-stop
```

## Links

- https://hub.docker.com/_/debian
- https://cloud.google.com/sdk/docs/downloads-docker
