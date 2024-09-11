output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "IDs of the public subnets"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "IDs of the private subnets"
  value       = module.vpc.private_subnets
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway (if created)"
  value       = var.enable_nat_gateway ? module.vpc.nat_gateway_id : ""
}

output "vpn_gateway_id" {
  description = "ID of the VPN Gateway (if created)"
  value       = var.enable_vpn_gateway ? module.vpc.vpn_gateway_id : ""
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = module.vpc.internet_gateway_id
}

output "eks_cluster_id" {
  description = "The ID of the EKS cluster"
  value       = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  description = "The endpoint of the EKS cluster"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_arn" {
  description = "The ARN of the EKS cluster"
  value       = module.eks.cluster_arn
}

output "eks_cluster_version" {
  description = "The version of Kubernetes running on the EKS cluster"
  value       = module.eks.cluster_version
}

output "eks_cluster_security_group_id" {
  description = "Security group ID of the EKS cluster"
  value       = module.eks.cluster_security_group_id
}

output "eks_managed_node_group_arns" {
  description = "ARNs of the EKS managed node groups"
  value       = module.eks.eks_managed_node_group_arns
}

output "eks_managed_node_group_names" {
  description = "Names of the EKS managed node groups"
  value       = module.eks.eks_managed_node_group_names
}

output "eks_managed_node_group_role_arn" {
  description = "The IAM role ARN used by the EKS managed node group"
  value       = module.eks.eks_managed_node_group_role_arn
}

output "eks_oidc_provider_arn" {
  description = "The OIDC provider ARN for the EKS cluster"
  value       = module.eks.oidc_provider_arn
}
