variable environment {
    type = "string"
    default = "dev"
}

variable availability_zones {
    type = "list"
}

variable es_version {
    type = "string"
    default = "6.2"
}

variable es_subnets {
    type = "list"
    default = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
}
