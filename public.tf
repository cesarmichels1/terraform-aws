resource "aws_subnet" "terraform_subnet_public_1a" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1)
  availability_zone       = "${data.aws_region.current.id}a"
  map_public_ip_on_launch = true

  tags = merge(
    local.tags,
    {
      Name                     = "terraform-subnet-1a",
      "kubernetes.io/role/elb" = 1
    }
  )
}
resource "aws_subnet" "terraform_subnet_public_1b" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2)
  availability_zone       = "${data.aws_region.current.id}b"
  map_public_ip_on_launch = true

  tags = merge(
    local.tags,
    {
      Name                     = "terraform-subnet-1b",
      "kubernetes.io/role/elb" = 1
    }
  )
}

