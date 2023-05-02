
variable "account" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list
}


variable "eks_cluster_ssh_key" {
  type        = string
}

variable "eks_cluster_name" {
  type        = string
}

variable "iam_eks_cluster_role" {
  type        = string
}

variable "cluster_version" {
  type        = string
}

variable "endpoint_private_access" {
  type        = bool
  default     = true
}


variable "disk_size" {
  type = string
}

variable "instance_type" {
  type = string

}

variable "min_scalesize" {
  type = string

}

variable "max_scalesize" {
  type = string

}

variable "desired_scalesize" {
  type = string

}

variable "ami_type" {
  type = string

}


variable "aws_iam_eks_node_attach_policies" {
  type = list
}


variable "aws_iam_eks_cluster_attach_policies" {
  type = list
}

 
variable "existing_security_group_ids" {
  type = list
  default = []
}

variable "ingress_rules" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_block  = string
      description = string
    }))

    default     = [
        {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          description = "Test cidr for 22"
        },
        {
          from_port   = 23
          to_port     = 23
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          description = "Test cidr for 23"
        },
    ]
}

variable "map-migrated-server-id" {
  type = string
  default = "d-server-03vkic1y0uzm11"
}

variable "release_version" {
  type = string
}