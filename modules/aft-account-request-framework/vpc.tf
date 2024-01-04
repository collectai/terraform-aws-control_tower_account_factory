# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

# TODO: Remove this tfsec-ignore when VPC flow logs are enabled
#tfsec:ignore:aws-ec2-require-vpc-flow-logs-for-all-vpcs
module "aft-vpc" {
  source  = "cloudposse/vpc/aws"
  version = ">= 2.1.0"

  name = "aft-management-vpc"

  ipv4_primary_cidr_block = var.aft_vpc_cidr

  assign_generated_ipv6_cidr_block = false
  internet_gateway_enabled         = true
  default_network_acl_deny_all     = false
  default_security_group_deny_all  = false
}

module "aft-default-sg" {
  source  = "cloudposse/security-group/aws"
  version = "2.2.0"
  name    = "aft-default-sg"

  create_before_destroy = false
  allow_all_egress      = true

  security_group_description = "Allow outbound traffic"

  vpc_id = module.aft-vpc.vpc_id
}

module "aft-vpc-subnets" {
  source             = "cloudposse/dynamic-subnets/aws"
  version            = "2.4.1"
  name               = "aft-vpc"
  availability_zones = slice(data.aws_availability_zones.available.names, 0, 2)
  vpc_id             = module.aft-vpc.vpc_id
  igw_id             = [module.aft-vpc.igw_id]

  ipv4_cidrs = [{
    private = [var.aft_vpc_private_subnet_01_cidr, var.aft_vpc_private_subnet_02_cidr]
    public  = [var.aft_vpc_public_subnet_01_cidr, var.aft_vpc_public_subnet_02_cidr]
  }]

  nat_gateway_enabled     = true
  public_subnets_enabled  = true
  map_public_ip_on_launch = false

  public_open_network_acl_enabled  = false
  private_open_network_acl_enabled = false
}