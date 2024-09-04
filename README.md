| Language | Framework | Platform | Author |
| -------- | -------- |--------|--------|
| ASP.NET Core | .NET Core 2.2 | Azure Web App, Virtual Machines |


# ASP.NET Core MVC application

Sample ASP.NET Core MVC application.

## License:

See [License](#)

## Contributing

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

# Dot NET Core Application Automation Documentation

This document provides a detailed overview of the GitHub Actions workflow for deploying a Dot NET Core application using Terraform, Docker, and Azure Kubernetes Service (AKS), alongside the Terraform infrastructure configuration.

## Prerequisites

### Fork the Repository

1. Go to the repository [URL](https://github.com/nushams/dotnet-aks).
2. Click the "Fork" button on the top-right corner of the page to create a copy of the repository under your GitHub account.

Then, set up a `Service Principal` in Azure and `AZURE_CREDENTIALS` in your GitHub Settings > Secrets and variables. The format of the secret should follow this format:
``` json
{
  "clientId": "Service Principal clientId",
  "clientSecret": "Secret created in the Service Principal",
  "subscriptionId": "Target subscription ID",
  "tenantId": "Your tenant ID"
}
```
> **_NOTE:_** Your Service Principal should have Owner access to your Subscription and levels under it. Also, provide `Group Administrator` access in your Entra ID to it, this is needed to create a user group for access.

## Workflow Overview

### Infrastructure as Code
IaC consist of following 3 files:
1. **main.tf** - Main settings of the resources.
2. **variables.tf** - Custom variables to source `main.tf` with settings.
3. **outputs.tf** - Output data of created resources, will use them in the pipeline.

## Kubernetes manifests and Docker
Kubernetes (k8s) is represented by using Azure Kubernetes Services (AKS) and Azure Container Registry for building and pushing Docker image(s). As typical k8s, it consist of following files:
1. **deployment.yaml** - Deployment configuration. Please keep in mind the image reference.
2. **service.yaml** - Service configuration.
3. **hpa.yaml** - Autoscaling setting at 50% up to 10 replicas.

## Workflow Configuration

```yaml
name: Dot NET Core Application

on:
  workflow_call:
    inputs:
      environment:
        description: 'Target environment'
        required: true
        type: string
```
The pipeline trigger has separated into different environments, depending on the repository branch it triggers the main `ci-cd-pipeline.yml` file.

#### The workflow consists of three main jobs:
1. **terraform** - Manages infrastructure using Terraform.
2. **build_and_test** - Builds and tests the .NET Core application.
3. **deploy** - Creates Docker images and deploys the application to AKS with scalability.

## High-Level Architecture

### Overview

This architecture sets up a CI/CD pipeline using GitHub Actions and Terraform to deploy a .NET Core application on Azure. 

## Main Components

1. **Azure Kubernetes Service (AKS)**:
   - Managed Kubernetes cluster where the application will be deployed.
   - Automatically handles scaling and orchestration of containers.

2. **Azure Container Registry (ACR)**:
   - Stores Docker images for the application.
   - Provides a private container registry to push and pull images.

3. **Monitor and Log Analytics**:
   - Monitoring and sending alerts on need.
   - Analysing logs and behaviour of the app.

## Diagram

![Architecture Diagram](./aspnet-core-dotnet-core/docs/architecture.eraserdiagram)  

## Destroy Infrastructure
Call the following code to destroy Terraform created infratsructure before installing new instance:
```bash
terraform destroy
```

## Summary

This solution provides a streamlined process for deploying a .NET Core application to Azure using Kubernetes. It automates infrastructure provisioning, application building, image management, and deployment through a combination of Terraform and GitHub Actions.