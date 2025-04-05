# Outputs
output "instance_name" {
  value = module.gcp_instance.instance_name
}

output "instance_external_ip" {
  value = module.gcp_instance.instance_external_ip
} 