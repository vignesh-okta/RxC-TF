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
  "RxC_UAT_PORTAL_RelypsaFLT_EXT" = {
    description = "External users assigned to Relypsa Portal"
    rule = "user.portalId=='10013'"
    admin_roles = ""
  },
  "RXC_UAT_PORTAL_VELTASSAKONNECT_EXT" = {
    description = "External users assigned to Relypsa Portal"
    rule = "user.portalId=='10008'"
    admin_roles = ""
  }
}


oidc_apps = {
  "RelypsaPortalApp" = {
  redirect_urls = ["https://www.mckrelypsaflt.uat.rxcrossroads.com"]
  bookmark_app_url = "https://www.mckrelypsaflt.uat.rxcrossroads.com"
  label  = "Actor ID"
  dataType = "string"
  required = "false"
  permissions = "READ_ONLY"
  appUser = "actorId"
  mapping = "String.len(user.actorId)>0?user.actorId:user.getInternalProperty('id')"
  },
  "RelypsaPhysicianApp" = {
  redirect_urls = ["https://www.mckveltassakonnect.uat.rxcrossroads.com"]
  bookmark_app_url = "https://www.mckveltassakonnect.uat.rxcrossroads.com"
  label  = "Actor ID"
  dataType = "string"
  required = "false"
  permissions = "READ_ONLY"
  appUser = "actorId"
  mapping = "String.len(user.actorId)>0?user.actorId:user.getInternalProperty('id')"
  }
}

org_whitelist_url = ["https://www.mckrelypsaflt.uat.rxcrossroads.com","https://www.mckveltassakonnect.uat.rxcrossroads.com"]

claim = "actorId"
