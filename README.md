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

## Use Case Examples
### Case 1: Open existing folder in a container

**Steps:**
1. Clone repo locally
2. Run **Remote-Containers: Open Folder in Container** command from Command Palette (F1)
3. Initiate starting point (.devcontainer/devcontainer.json) for dev container via:
    > Dockerfile (*Preferred in most cases*)  
    > Filterable List (*Recommended for this demo*)
4. Building and starting dev container
    > bind mount local filesystem into dev container

### Case 2: Open Git repo in isolated container volume

**Steps:**
1. Run **Remote-Containers: Clone Repository in Container Volume** command from Command Palette (F1)
2. Enter valid repository URL which includes:
    - PR URL
    - Branch URL
3. Initiate starting point (.devcontainer/devcontainer.json) for dev container via:
    > Dockerfile (*Preferred in most cases*)  
    > Filterable List (*Recommended for this demo*)
4. Building and starting dev container
    > local/isolated docker volume attached to dev container

### Case 3: Deploy dev container to remote docker host

**Steps:**
1. Establish connection between VSC and remote Docker host via 2 different methods:
 
    Method 1: VS Code setting - *docker.host* property in *setting.json*
    ```
    "docker.host":"ssh://your-remote-user@your-remote-machine-fqdn-or-ip-here"
    ```  

    Method 2: Local environment variables, including:
    > DOCKER_HOST  
    > DOCKER_CERT_PATH (**required for tcp**)  
    > DOCKER_TLS_VERIFY (**required for tcp**)

2. Initiate starting point (.devcontainer/devcontainer.json) for dev container via:
    > Dockerfile (*Preferred in most cases*)  
    > Filterable List (*Recommended for this demo*)

3. Covert dev container file to define the workspace/source code mount:  
    
    *Option 1*: Volume mount

    > Use this option if you do **NOT** have login access to the remote host
    ```
    "workspaceMount": "source=remote-workspace,target=/workspace,type=volume"
    "workspaceFolder": "/workspace",
    ```
    *Option 2*: Filesystem bind mount

    > If you **DO** have login access to remote host, this method is available for adopt
    ```
    "workspaceMount": "source=/absolute/path/on/remote/machine,target=/workspace,type=bind,consistency=cached"
    "workspaceFolder": "/workspace",
    ```
4. Building and starting dev container