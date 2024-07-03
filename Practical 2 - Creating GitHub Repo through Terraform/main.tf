terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  token = "<<Generate-token-from-GitHub-Developer-Setting>>"
}

resource "github_repository" "repo-via-terraform-tf" {
  name = "repo-via-terraform-tf"
}