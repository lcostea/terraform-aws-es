variable environment {
    type = "string"
    default = "dev"
}

variable availability_zones {
    type = "list"
}

variable region {
    type = "string"
}

variable es_version {
    type = "string"
    default = "6.2"
}

variable instance_type {
    type = "string"
    default = "t2.small.elasticsearch"
}

variable vpc_id {
    type = "string"
    default = "t2.small.elasticsearch"
}

variable data_subnets {
    type = "list"
    default = ["10.10.21.0/24", "10.10.22.0/24", "10.10.23.0/24"]
}
