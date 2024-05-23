variable "project_name" {
    type = string
   
}

variable "environment" {
    type = string
    default = "dev"
}

variable "common_tags" {
    type = map

}

#### VPC ####
variable "vpc_cidr" {
    type = string 
    default = "10.0.0.0/16"

}

variable "dns_enable_hostnames" {
    type = bool
    default = "true"
}

variable "vpc_tags" {
    type = map
    default = {}
}

#### IGW ####
variable "igw_tags" {
    type = map
    default = {}
}
#### Public SUBNET ####
variable "public_subnet_cidrs" {
    type = list
    validation {
        condition = length(var.public_subnet_cidrs) == 2
        error_message = "please provide two valid public subnet CIDR"
    }
}

variable "public_subnet_cidr_tags" {
    type = map
    default = {}
}

variable "private_subnet_cidrs" {
    type = list 
    validation {
        condition = length(var.private_subnet_cidrs) == 2
        error_message = "please provide two valid private subnet CIDR"
    }

}

variable "private_subnet_cidr_tags" {
    type = map 
    default = {}
}

variable "database_subnet_cidrs" {
    type = list
    validation {
        condition = length(var.database_subnet_cidrs) == 2
        error_message = "please provide two valid database subnet CIDR"
    }
}


variable "database_subnet_cidr_tags" {
    type = map 
    default = {}
}

variable "aws_nat_gateway_tags" {
    type = map 
    default = {}
}

variable "public_route_table_tags" {
    type = map 
    default = {}
}

variable "private_route_table_tags" {
    type = map 
    default = {}
}

variable "database_route_table_tags" {
    type = map 
    default = {}
} 




