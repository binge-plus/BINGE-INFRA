output "common_firewall_rule_ids" {
  description = "IDs of common firewall rules"
  value = {
    for name, rule in google_compute_firewall.common_rules : name => rule.id
  }
}

output "app_firewall_rule_ids" {
  description = "IDs of application firewall rules"
  value = {
    for name, rule in google_compute_firewall.app_rules : name => rule.id
  }
}

output "all_firewall_rule_names" {
  description = "Names of all created firewall rules"
  value = concat(
    [for rule in google_compute_firewall.common_rules : rule.name],
    [for rule in google_compute_firewall.app_rules : rule.name]
  )
} 