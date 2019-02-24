terraform {
    backend "s3"{
        encrypt = true
        bucket = "elasticsearch-state"
        key = "terraform-es/vpc.tfstate"
        region = "eu-central-1"
    }
}
