
output "AllGroupIds" {
  value = values(module.AppGroups.AllGroupIds)[*].id
}

output "Attribute" {
  value = values(module.CreateCustomUserAttributes.Attribute)
}
