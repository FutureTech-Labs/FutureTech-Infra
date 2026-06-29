terraform {
  backend "s3" {
    bucket       = "futuretech-tfstate"
    key          = "global/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
    encrypt      = true
  }
}