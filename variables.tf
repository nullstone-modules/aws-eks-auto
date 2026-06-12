variable "enable_auto_mode" {
  type        = bool
  default     = true
  description = <<EOF
Enable EKS Auto Mode, which allows EKS to manage compute, storage, and load balancing for the cluster.
When enabled, EKS provisions and manages EC2 nodes automatically using the general-purpose node pool.
EOF
}

variable "kubernetes_version" {
  type        = string
  default     = "1.35"
  description = <<EOF
Desired Kubernetes master version.
If you do not specify a value, the latest available version at resource creation is used and no upgrades will occur except those automatically triggered by EKS.
The value must be configured and increased to upgrade the version when desired.
Downgrades are not supported by EKS.
EOF

  validation {
    condition     = can(regex("^[0-9]+\\.[0-9]+$", var.kubernetes_version))
    error_message = "kubernetes_version must be in the format 'MAJOR.MINOR' (e.g. '1.35')."
  }
}

variable "log_retention_in_days" {
  type        = number
  default     = 365
  description = <<EOF
This defines the retention period for the CloudWatch logs for this Kubernetes cluster.
EOF

  validation {
    condition     = var.log_retention_in_days >= 1
    error_message = "log_retention_in_days must be at least 1 day"
  }
}

variable "cert_manager_chart_version" {
  type        = string
  default     = "v1.16.2"
  description = "The version of the cert-manager Helm chart (https://charts.jetstack.io) to install. cert-manager is required by webhook-based operators such as the ADOT operator."
}
