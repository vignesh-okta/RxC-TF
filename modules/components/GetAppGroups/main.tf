
terraform {
  required_providers {
    okta = {
      source = "oktadeveloper/okta"
    }
  }
}

data "okta_group" "AllOktaGroups" {
  for_each  = toset(var.groups)
  name = each.key
}

output "name" {
  value = data.okta_group.AllOktaGroups
}