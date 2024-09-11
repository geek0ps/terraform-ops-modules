variable "azs" {
  description = "Availability zones to be used for subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Whether to enable NAT gateway"
  type        = bool
  default     = false
}

variable "enable_vpn_gateway" {
  description = "Whether to enable VPN gateway"
  type        = bool
  default     = false
}

variable "single_nat_gateway" {
  description = "Whether to create a single NAT gateway across all subnets"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
  default     = {
    "Environment" = "dev"
    "Terraform"   = "true"
  }
}


variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "my-vpc"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}


variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "my-cluster"
}

variable "cluster_version" {
  description = "The version of Kubernetes for the EKS cluster"
  type        = string
  default     = "1.30"
}

variable "cluster_endpoint_public_access" {
  description = "Whether to enable public access to the EKS cluster"
  type        = bool
  default     = true
}

variable "cluster_addons" {
  description = "Map of EKS cluster addons"
  type        = map(any)
  default     = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for EKS worker nodes"
  type        = list(string)
}

variable "control_plane_subnet_ids" {
  description = "List of subnet IDs for the EKS control plane"
  type        = list(string)
}

variable "instance_types" {
  description = "List of instance types for EKS managed node groups"
  type        = list(string)
  default     = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
}

variable "eks_managed_node_groups" {
  description = "Map of EKS managed node groups configuration"
  type        = map(any)
  default     = {
    example = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["m5.xlarge"]
      min_size       = 2
      max_size       = 10
      desired_size   = 2
    }
  }
}

variable "enable_cluster_creator_admin_permissions" {
  description = "Whether to enable cluster creator admin permissions"
  type        = bool
  default     = true
}

variable "access_entries" {
  description = "Map of access entries to the EKS cluster"
  type        = map(any)
  default     = {
    example = {
      kubernetes_groups = []
      principal_arn     = "arn:aws:iam::123456789012:role/something"
      policy_associations = {
        example = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
          access_scope = {
            namespaces = ["default"]
            type       = "namespace"
          }
        }
      }
    }
  }
}

variable "create_cluster" {
  type = bool
  default = false
  description = "To create cluster or not"
}

#test