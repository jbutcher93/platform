data "terraform_remote_state" "gcs_bucket_state" {
  backend = "gcs"
  config = {
    bucket = "terraform-state-file-demo"
    prefix = "terraform/bucket"
  }
}
