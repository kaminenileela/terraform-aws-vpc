resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = var.dns_enable_hostnames

    tags = merge(var.common_tags,
           var.vpc_tags,
           {
            Name = local.resource_name
           } 
    )
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id

    tags = merge(var.common_tags,
    var.igw_tags,
    {
        Name = local.resource_name
    })
}

### public subnet ###
resource "aws_subnet" "public" {

    count = length(var.public_subnet_cidrs)
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_cidrs[count.index]
    availability_zone = local.az_zones[count.index]
    #map_public_ip_on_launch = "true"

    tags = merge(var.common_tags,
    var.public_subnet_cidr_tags,
    {
        Name = "${local.resource_name}-${local.az_zones[count.index]}"
    })
}