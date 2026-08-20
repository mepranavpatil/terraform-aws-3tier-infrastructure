terraform {
  backend "s3" {
    bucket       = "pranav001-backup-2704"
    key          = "dev/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}