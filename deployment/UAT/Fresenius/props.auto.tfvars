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
  "RxC_UAT_PORTAL_FreseniusManufacturer_EXT" = {
    description = "External users assigned to Fresenius Portal"
    rule = "user.portalId=='10010'"
    admin_roles = ""
  }
}


oidc_apps = {
  "FreseniusPortalApp" = {
  redirect_urls = ["https://www.mckvelphoroaccesssolution.uat.rxcrossroads.com"]
  bookmark_app_url = "https://www.mckvelphoroaccesssolution.uat.rxcrossroads.com"
  label  = "Actor ID"
  dataType = "string"
  required = "false"
  permissions = "READ_ONLY"
  appUser = "actorId"
  mapping = "String.len(user.actorId)>0?user.actorId:user.getInternalProperty('id')"
  }
}

org_whitelist_url = ["https://www.mckvelphoroaccesssolution.uat.rxcrossroads.com"]

claim = "actorId"
