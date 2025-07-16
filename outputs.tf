# Outputs
output "fe-instance_name" {
  value = module.binge-plus-fe-server.instance_name
}

output "fe-instance_external_ip" {
  value = module.binge-plus-fe-server.instance_external_ip
}

output "be-instance_name" {
  value = module.binge-plus-be-server.instance_name
}

output "be-instance_external_ip" {
  value = module.binge-plus-be-server.instance_external_ip
}

output "admin-instance_name" {
  value = module.binge-plus-admin-server.instance_name
}

output "admin-instance_external_ip" {
  value = module.binge-plus-admin-server.instance_external_ip
} 
