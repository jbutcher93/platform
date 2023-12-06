module "gce" {
  source                  = "../../modules/gce"
  instance_name           = "first-instance"
  firewall_rule_name      = "allow-all-to-foo-and-bar-tags"
  startup_script_location = "${path.root}/../demo.sh"
}
