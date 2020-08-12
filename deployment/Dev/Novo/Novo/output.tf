
output "AllGroupIds" {
  value = values(module.AppGroups.AllGroupIds)[*]
}
#
# output "Attribute" {
#   value = values(module.CreateCustomUserAttributes.Attribute)
# }
output "Tenant_URL" {
  value = join("",["https://",var.org_name,".",var.base_url])
}

output "Issuer_URL" {
  value = join("",["https://",var.org_name,".",var.base_url,"/oauth2/default"])
}
output "Password_Policy_Id" {
  value = module.AllOIDCapps.Policy.id
}

output "AppInfo" {
  value = formatlist(
    "Client ID of %s = %s",
  values(module.AllOIDCapps.Client_Id)[*].label,
  values(module.AllOIDCapps.Client_Id)[*].id)
}

output "BookmarkAppInfo" {
  value = formatlist(
    "Bookmark Request Context of %s = ?fromURI=home/bookmark/%s/2557",
  values(module.AllOIDCapps.BookmarkAppInfo)[*].label,
  values(module.AllOIDCapps.BookmarkAppInfo)[*].id)
}

# output Test {
#   value = module.AllOIDCapps.upper_roles
# }
