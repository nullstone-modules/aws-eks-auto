# aws-eks-auto

Creates a Kubernetes cluster in Auto mode that uses AWS-managed nodes.

## When to use?

### When Auto Mode is GREAT
- SaaS workloads
- stateless services
- CI runners
- internal platforms
- preview environments (👀 very relevant to you)
- cost optimization focus
- teams without deep k8s infra skills

### When Auto Mode is NOT ideal
- custom networking
- heavy DaemonSet reliance
- GPU tuning
- special storage drivers
- low-level performance control
- platform engineering teams wanting full control
- highly predictable infra topology needs

## Included Addons

AWS automatically manages the following addons:
- VPC CNI
- CoreDNS
- kube-proxy
- Pod Identity Agent
- metrics server
- networking dataplane components

The module also installs the following via Helm:
- **cert-manager** — issues/renews in-cluster TLS certificates and is the prerequisite for webhook-based operators such as the ADOT operator used by the `aws-eks-otel-adot` module.

## Limitations

In auto mode, AWS manages a fleet of nodes which prevents you from performing various operations:
1. You cannot run DaemonSets.
2. You cannot SSH into nodes.
3. You cannot optimize pod scheduling; AWS optimizes this.
