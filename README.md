#📌 Project Overview

This project demonstrates an end-to-end Azure DevOps & Cloud-Native setup where infrastructure and application deployment are handled using Terraform, Azure Kubernetes Service (AKS), and Istio Service Mesh.

The goal of this repository is to showcase:

Infrastructure provisioning using Infrastructure as Code (IaC)

Deployment of a private AKS cluster

Service-to-service traffic management using Istio

Exposure of applications using Istio Ingress Gateway backed by Azure Load Balancer

Real-world DevOps troubleshooting and networking concepts in Azure

This repository is intentionally designed as a learning + portfolio project, reflecting real challenges faced by DevOps engineers in production-like environments.

###🧱 High-Level Architecture

Traffic Flow:

Client / Browser
|
Azure Load Balancer (created by AKS Service)
|
Istio Ingress Gateway
|
Istio VirtualService
|
Kubernetes Service (ClusterIP)
|
Application Pod (Nginx)

###☁️ Azure Components Used

Azure Subscription

Azure Resource Group

Azure Virtual Network (VNet)

AKS (Private Cluster)

Azure Load Balancer

Private DNS Zone

Managed Identities

Azure Container Registry (optional / future)

###⚙️ Kubernetes & Service Mesh Components

Kubernetes (AKS)

Istio Service Mesh

Istio Ingress Gateway

Gateway

VirtualService

Kubernetes Services

Kubernetes Deployments

###🛠 Infrastructure as Code (Terraform)
Current Terraform Structure
terraform/
├── main.tf
└── provider.tf

At the current stage, the Terraform setup focuses on getting a working AKS environment quickly.
As the project matures, this structure will be refactored into a more production-grade layout using modules.

Planned Terraform Structure (Future)
terraform/
├── modules/
│ ├── vnet/
│ ├── aks/
│ └── dns/
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
└── terraform.tfvars

###🚀 Deployment Workflow
**1️⃣ Prerequisites**

Azure CLI

Terraform

kubectl

istioctl

Valid Azure subscription

Logged in via az login

**2️⃣ Provision Infrastructure**
cd terraform
terraform init
terraform plan
terraform apply

This provisions:

Resource Group

VNet and Subnets

Private AKS Cluster

Required networking components

**3️⃣ Connect to AKS**
az aks get-credentials \
 --resource-group <rg-name> \
 --name <aks-name>

**4️⃣ Install Istio**
istioctl install --set profile=default

Enable automatic sidecar injection:

kubectl label namespace default istio-injection=enabled

**5️⃣ Deploy Application (Nginx)**

Kubernetes Deployment

Kubernetes Service (ClusterIP)

**6️⃣ Configure Istio Ingress**

Istio Gateway

Istio VirtualService

Example:

apiVersion: networking.istio.io/v1beta1
kind: Gateway

apiVersion: networking.istio.io/v1beta1
kind: VirtualService

**🌐 Networking & DNS Explanation**

AKS is deployed as a private cluster

Nodes live inside a custom VNet

Private DNS Zone is responsible for resolving:

Kubernetes internal services

AKS API server endpoint

Istio operates at L7, while Azure Load Balancer operates at L4

Key takeaway:
Istio does not replace Azure Load Balancer — it works on top of it.

####🧩 Challenges Faced & Solutions
**❌ Azure CLI / PATH Issues**

Problem:
Azure CLI commands not recognized.

Solution:
Verified installation path and reloaded shell environment.

**❌ Confusion Around Private DNS in AKS**

Problem:
Unclear whether AKS private DNS is the “real” DNS.

Solution:
Understood that:

Azure Private DNS resolves AKS control plane & services

CoreDNS resolves Kubernetes service names internally

Istio does not replace DNS; it relies on it

**❌ Istio Gateway Not Routing Traffic**

Problem:
Ingress traffic was not reaching the application.

Solution:
Validated:

Correct Gateway selector

Matching VirtualService host

Correct namespace references

**❌ Azure Load Balancer Behavior**

Problem:
Uncertainty around how Azure LB is created and managed.

Solution:
Learned that:

AKS automatically provisions Azure LB

Kubernetes Service of type LoadBalancer controls it

Istio Ingress runs behind the Azure LB

**🧹 Cleanup & Re-creation Strategy**

Before deleting Azure resources:

No persistent data is stored

Terraform state can be recreated safely

VNet and AKS can be rebuilt without side effects

Best practice:
Always destroy using Terraform:

terraform destroy

**📈 Future Improvements**

Terraform modules

NAT Gateway for controlled egress

Azure Application Gateway Ingress Controller

CI/CD using GitHub Actions or Azure DevOps

Observability (Prometheus, Grafana, Kiali)

Multi-environment setup (dev / stage / prod)

**🎯 Why This Project Matters**

This project reflects real DevOps problem-solving, not just a “happy-path” tutorial:

Private AKS networking

Service mesh fundamentals

Azure Load Balancer internals

DNS and traffic flow clarity

IaC best practices

It is intentionally designed to be iterative and expandable, just like real production systems.

###👤 Author

Tanzeel Akhther
DevOps / Cloud Engineer
Azure | Kubernetes | Terraform | Istio
