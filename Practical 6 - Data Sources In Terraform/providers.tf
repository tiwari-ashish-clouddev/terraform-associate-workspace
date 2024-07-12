provider "aws" {
  region = var.mumbai_region
}

provider "aws" {
  region = var.singapore_region
  alias  = "singapore"
}