
ok_groups = {

"RXC_DEV_PORTAL_RelypsaFLT_EXT" = {
  description = "External users assigned to Relypsa Portal"
  rule = "user.portalId=='10013'"
  admin_roles = ""
},
"RXC_DEV_PORTAL_RelypsaFLT" = {
  description = "External users assigned to Relypsa Portal"
  rule = ""
  admin_roles = ""
}
}


oidc_apps = {

"RelypsaPortalApp" = {
redirect_urls = ["https://www.vkgatewayy2i.dev.mckesson.com", "http://localhost:61067"]
bookmark_app_url = "https://www.vkgatewayy2i.dev.mckesson.com"
label  = "Actor ID"
dataType = "string"
required = "false"
permissions = "READ_ONLY"
appUser = "actorId"
mapping = "String.len(user.actorId)>0?user.actorId:user.getInternalProperty('id')"
}


}

org_whitelist_url = ["https://www.vkgatewayy2i.dev.mckesson.com"]

claim = "actorId"
