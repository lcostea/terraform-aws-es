#!/usr/bin/env bash



#this will create the 3 subnets and export them in order to be used in es
create_subnets() {
    cd subnets

    terraform apply -auto-approve \
    -var "region=$TERRAFORM_aws_region" \
    -var "availability_zones=$TERRAFORM_aws_availability_zones" \
    -var "environment=$TERRAFORM_environment" \
    -var "vpc_id=$TERRAFORM_vpc_id" \

    TERRAFORM_subnet_0=$(terraform output subnet_0)
    TERRAFORM_subnet_1=$(terraform output subnet_1)
    TERRAFORM_subnet_2=$(terraform output subnet_2)

    cd ..
}

#this creates the aws elasticsearch cluster and exports its id so we can setup alerts for it
create_aws_es_cluster() {
    cd elasticsearch_cluster

    terraform apply -auto-approve \
    -var "region=$TERRAFORM_aws_region" \
    -var "availability_zones=$TERRAFORM_aws_availability_zones" \
    -var "environment=$TERRAFORM_environment" \
    -var "vpc_id=$TERRAFORM_vpc_id" \

    cd ..
}


#this will setup the cloudwatch alerts for our cluster
setup_cloudwatch_alerts() {

}


#these TERRAFORM_ variables will probably be calculated from other modules of the pipeline
TERRAFORM_vpc_id="vpc-072b0d68981a3b05e"

TERRAFORM_aws_region="eu-central-1"

TERRAFORM_aws_availability_zones='[
  "eu-central-1a",
  "eu-central-1b",
  "eu-central-1c"
]'

TERRAFORM_environment="dev"

terraform init

create_subnets

create_aws_es_cluster

setup_cloudwatch_alerts