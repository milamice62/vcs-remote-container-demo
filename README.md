# Dev Workstation Demostration: Visual Studio Code Remote - Containers

This repo contains quick step-by-step feature walkthrough for *Visual Studio Code Remote - Containers* extension.

## Prerequisite

Following items must be installed at local workstation:

- Visual Studio Code
- Docker Desktop
- Remote - Containers extension

Check Docker:
```

docker --version
# Docker version 19.03.12, build 48a66213fe
```

## Use Case Study
### Open existing folder in a container

Steps:
1. Clone repo locally
2. Run **Remote-Containers: Open Folder in Container** command from Command Palette (F1)
3. Initiate starting point (.devcontainer/devcontainer.json) for dev container via:
    > Dockerfile (Preferred if existed)
    > Filterable List
4. Building and starting dev container
    > bind mount local filesystem into dev container


