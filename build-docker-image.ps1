# https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/docker?view=azure-devops#windows

[CmdletBinding()] 
param(
    [Parameter(Position = 0, Mandatory, ValueFromPipeline)]
    [string]$dockerId,
    [Parameter(Position = 1, Mandatory, ValueFromPipeline)]
    [string]$dockerToken,
    [Parameter(Position = 2, Mandatory, ValueFromPipeline)]
    [string]$userName,
    [Parameter(Position = 3, Mandatory, ValueFromPipeline)]
    [string]$companyName,
    [Parameter(Position = 4, Mandatory, ValueFromPipeline)]
    [string]$productKey
)

Clear-Host

$fileToCheck = "Dockerfile"
if (-not (Test-Path $fileToCheck -PathType leaf)) {
    Write-Error "error: $fileToCheck not exists in $PWD"
    exit 1
}


docker login -u $dockerId -p $dockerToken


$BuildDate = date -u +"%Y-%m-%dT%H:%M:%SZ"
$GitUrl = git config --get remote.origin.url
$GitCommit = git rev-parse --short HEAD
$CodeVersion = "1.0.0"
$imageName = "vb6-in-docker"
$imageTag = "1.0.0"
$DockerBuildT = "$dockerId/${imageName}:$imageTag"

docker build `
    --build-arg BUILD_DATE=$BuildDate `
    --build-arg VERSION=$CodeVersion `
    --build-arg VCS_URL=$GitUrl `
    --build-arg VCS_REF=$GitCommit `
    --build-arg USER_NAME=$userName `
    --build-arg COMPANY_NAME=$companyName `
    --build-arg KEY=$productKey `
    -t $DockerBuildT .

docker images