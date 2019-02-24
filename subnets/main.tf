resource "aws_subnet" "subnet_0" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.es_subnets[0]}"
  availability_zone = "${var.availability_zones[0]}"

  tags = {
    stage = "${var.environment}"
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.es_subnets[1]}"
  availability_zone = "${var.availability_zones[1]}"

  tags = {
    stage = "${var.environment}"
  }
}


resource "aws_subnet" "subnet_2" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.es_subnets[2]}"
  availability_zone = "${var.availability_zones[2]}"

  tags = {
    stage = "${var.environment}"
  }
}