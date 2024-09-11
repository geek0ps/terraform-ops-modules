# VPC and EKS Terraform Module

This Terraform module deploys a fully managed AWS Virtual Private Cloud (VPC) and Amazon Elastic Kubernetes Service (EKS) cluster. It handles the creation of the network infrastructure, including subnets, NAT gateways, and the EKS cluster with managed node groups.

## Usage

To use this module in your Terraform configuration, you can source it directly from GitHub:

```hcl
module "vpc-eks" {
  source          = "github.com/geek0ps/terraform-ops-modules/vpc-eks"
  ....other variables.....
  tags = {
    Environment = "production"
    Terraform   = "true"
  }
}
```

### Variables

| Name                      | Type         | Default              | Description                                                                 |
|---------------------------|--------------|----------------------|-----------------------------------------------------------------------------|
| `vpc_name`                 | `string`     | n/a                  | Name of the VPC.                                                            |
| `create_cluster`           | `bool`       | `true`               | Set to `true` to create an EKS cluster, `false` to skip EKS creation.       |
| `vpc_cidr`                 | `string`     | `10.0.0.0/16`        | The CIDR block for the VPC.                                                 |
| `azs`                      | `list(string)` | `[]`               | List of availability zones to use for subnets.                              |
| `private_subnets`          | `list(string)` | `[]`               | List of private subnet CIDRs.                                               |
| `public_subnets`           | `list(string)` | `[]`               | List of public subnet CIDRs.                                                |
| `enable_nat_gateway`       | `bool`       | `false`              | Whether to create NAT gateways for the VPC.                                 |
| `enable_vpn_gateway`       | `bool`       | `false`              | Whether to create a VPN gateway for the VPC.                                |
| `single_nat_gateway`       | `bool`       | `false`              | Whether to use a single NAT gateway for all subnets.                        |
| `cluster_name`             | `string`     | `eks-cluster`        | The name of the EKS cluster.                                                |
| `instance_types`           | `list(string)` | `[]`               | List of EC2 instance types for the EKS worker nodes.                        |
| `eks_managed_node_groups`  | `map(any)`   | `{}`                 | Configuration of EKS managed node groups, including instance types and sizes.|
| `tags`                     | `map(string)` | `{}`                 | Tags to apply to resources.                                                 |

### Example

```hcl
module "vpc-eks" {
  source          = "github.com/geek0ps/terraform-ops-modules/vpc-eks"
  vpc_name        = "staging-vpc"
  create_cluster  = true
  vpc_cidr        = "10.1.0.0/16"

  azs             = ["us-west-2a", "us-west-2b"]
  private_subnets = ["10.1.1.0/24", "10.1.2.0/24"]
  public_subnets  = ["10.1.101.0/24", "10.1.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false
  single_nat_gateway = true

  cluster_name = "staging-cluster"

  instance_types = ["m5.large"]
  eks_managed_node_groups = {
    default = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["m5.large"]
      min_size       = 2
      max_size       = 4
      desired_size   = 2
    }
  }

  tags = {
    Environment = "staging"
    Project     = "example-project"
  }
}
```

### Outputs

| Name                   | Description                                    |
|------------------------|------------------------------------------------|
| `vpc_id`                | The ID of the VPC.                             |
| `public_subnets`        | List of public subnet IDs.                     |
| `private_subnets`       | List of private subnet IDs.                    |
| `eks_cluster_id`        | The ID of the EKS cluster.                     |
| `eks_cluster_endpoint`  | The endpoint for the EKS cluster API.          |
| `eks_node_group_arns`   | List of ARNs for the EKS managed node groups.  |

### Requirements

- Terraform >= 0.13
- AWS provider

### Providers

| Name  | Version |
|-------|---------|
| `aws` | `>= 3.0`|

---

This README gives users a clear guide on how to implement the `vpc-eks` module, along with explanations for all the variables and outputs they can use. It includes an example of how to configure the module and how to set custom inputs like `vpc_name`, `cluster_name`, and `instance_types`.