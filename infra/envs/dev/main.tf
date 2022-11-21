locals {
  domain = "dev-cld2.elancoapps.com"
}

module "infra" {
  source = "../../"
  
  environment = "dev"
}
