CustomUserAttributes = {
"actorId" = {
      label = "Actor ID"
      dataType = "string"
      description = "Actor ID attribute"
      required = "false"
      permissions = "HIDE"
  },
  "portalId" = {
      label = "Portal ID"
      dataType = "string"
      description = "Portal ID attribute"
      required = "false"
      permissions = "HIDE"
  }
}

ok_groups = {
  "RxC_DEV_PORTAL_RelypsaFLT_EXT" = {
    description = "External users assigned to Relypsa Portal"
    rule = "user.portalId=='10013'"
    admin_roles = ""
  },
  "RXC_DEV_PORTAL_VELTASSAKONNECT_EXT" = {
    description = "External users assigned to Relypsa Portal"
    rule = "user.portalId=='10008'"
    admin_roles = ""
  }
}


oidc_apps = {
  "RelypsaPortalApp" = {
  redirect_urls = ["https://www.vkgatewayy2i.dev.mckesson.com", "http://localhost:61067", "https://www.vkgatewayY2I.dev.Mckesson.com"]
  bookmark_app_url = "https://www.vkgatewayy2i.dev.mckesson.com"
  label  = "Actor ID"
  dataType = "string"
  required = "false"
  permissions = "READ_ONLY"
  appUser = "actorId"
  mapping = "String.len(user.actorId)>0?user.actorId:user.getInternalProperty('id')"
},
"RelypsaPhysicianApp" = {
redirect_urls = ["https://www.veltassakonnecty2i.dev.mckesson.com", "http://localhost:63396", "https://www.veltassakonnectY2I.dev.Mckesson.com"]
bookmark_app_url = "https://www.veltassakonnecty2i.dev.mckesson.com"
label  = "Actor ID"
dataType = "string"
required = "false"
permissions = "READ_ONLY"
appUser = "actorId"
mapping = "String.len(user.actorId)>0?user.actorId:user.getInternalProperty('id')"
}
}

org_whitelist_url = ["https://www.vkgatewayy2i.dev.mckesson.com","http://localhost:61067","https://www.veltassakonnecty2i.dev.mckesson.com", "http://localhost:63396"]

claim = "actorId"
