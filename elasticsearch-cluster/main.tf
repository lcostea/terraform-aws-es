module "elasticsearch" {
    #use a specific version, always better then using master or HEAD
  source                  = "git::https://github.com/cloudposse/terraform-aws-elasticsearch.git?ref=0.2.0"
  namespace               = "eg"
  stage                   = "${var.environment}"
  name                    = "tf-es-${var.environment}"
  dns_zone_id             = "Z14EN2YD427LRQ"
  security_groups         = ["sg-XXXXXXXXX", "sg-YYYYYYYY"]
  vpc_id                  = "vpc-XXXXXXXXX"
  subnet_ids              = ["subnet-XXXXXXXXX", "subnet-YYYYYYYY"]
  zone_awareness_enabled  = "true"
  elasticsearch_version   = "${var.es_version}"
  instance_type           = "${var.instance_type}"
  instance_count          = "${var.instance_count}"
    #these roles should be created in a separate module
  iam_role_arns           = "${var.iam_role_arns}"
  iam_actions             = ["es:ESHttpGet", "es:ESHttpPut", "es:ESHttpPost"]
  encrypt_at_rest_enabled = "true"
  kibana_subdomain_name   = "kibana-es"

  advanced_options {
    "rest.action.multi.allow_explicit_index" = "true"
  }
}