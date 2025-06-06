# Outputs
output "instance_name" {
  value = module.binge-plus-server.instance_name
}

output "instance_external_ip" {
  value = module.binge-plus-server.instance_external_ip
}

output "admin-instance_name" {
  value = module.binge-plus-admin-server.instance_name
}

output "admin-instance_external_ip" {
  value = module.binge-plus-admin-server.instance_external_ip
} 