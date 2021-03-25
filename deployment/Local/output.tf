
output "AllGroupIds" {
  value    = values(module.GetAppGroups.name)[*].id
  description = "all the groupIDs"
}
