terraform {
  // Terraform本体に対するバージョン制約
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      // Providerに対するバージョン制約
      version = "5.17.0"
    }
  }
}
