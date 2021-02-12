### Visual Basic 6 with base Windows Server Core

## Supported

- [`docker` (*Dockerfile*)](https://github.com/lzocateli00/vb6-in-docker/tree/main/docker)

[![Downloads from Docker Hub](https://img.shields.io/docker/pulls/lzocateli/vb6-in-docker.svg)](https://registry.hub.docker.com/u/lzocateli/vb6-in-docker)
[![Stars on Docker Hub](https://img.shields.io/docker/stars/lzocateli/vb6-in-docker.svg)](https://registry.hub.docker.com/u/lzocateli/vb6-in-docker) 

[![](https://images.microbadger.com/badges/image/lzocateli/vb6-in-docker.svg)](https://microbadger.com/images/lzocateli/vb6-in-docker "Get your own image badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/lzocateli/vb6-in-docker.svg)](https://microbadger.com/images/lzocateli/vb6-in-docker "Get your own version badge on microbadger.com")

## Configuration

You need to set these environment variables:

* `AZP_URL` - Required. The Azure DevOps organization
* `AZP_TOKEN` - Required. The personal access token PAT from Azure DevOps. 
* `AZP_POOL` - The agent pool. Optional. Default value: `Default`
* `AZP_AGENT_NAME` - Name of agent to be displayed in DevOps Agent Pool
* `AZP_WORK` - Folder where the build will be executed.  Default value: `_work`

## Running

This container is to be run on Windows

To start a container in detached mode:

````pwsh
docker run --name vb6-in-docker `
    -d `
    -e AZP_URL=https://dev.azure.com/your_subscription/ `
    -e AZP_TOKEN=your PAT `
    -e AZP_POOL=your agent pool name `
    -e AZP_AGENT_NAME=your agent name `
    -e AZP_WORK=G:\_work `
    lzocateli/vb6-in-docker:1.0.0 
````

To start a container in foreground mode:

````pwsh
docker run --name vb6-in-docker `
    -ti `
    --rm `
    -e AZP_URL=https://dev.azure.com/your_subscription/ `
    -e AZP_TOKEN=your PAT `
    -e AZP_POOL=your agent pool name `
    -e AZP_AGENT_NAME=your agent name `
    -e AZP_WORK=G:\_work `
    lzocateli/vb6-in-docker:1.0.0 
````

## Maintainers

* [email: Lincoln Zocateli](mailto:lzocateli00@outlook.com), [facebook: Lincoln Zocateli](https://www.facebook.com/lzocateli00), [twitter: @lzocateli00](https://twitter.com/lzocateli00)


