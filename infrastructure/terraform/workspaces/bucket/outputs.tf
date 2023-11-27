output "name" {
  value = "John Butcher"
}

output "remote_state_test" {
  value       = data.terraform_remote_state.gcs_bucket_state.outputs.name
  description = "Testing ability to query remote state file for information (e.g. outputs)"
}
