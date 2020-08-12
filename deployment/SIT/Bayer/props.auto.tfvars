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
  "RxC_SIT_PORTAL_BetaPlusManufacturer_EXT" = {
    description = "External users assigned to Bayer Beta Plus Portal"
    rule = "user.portalId=='12001'"
    admin_roles = ""
  }
}


oidc_apps = {
  "BBPPortalApp" = {
  redirect_urls = ["https://www.portalbetaseronY2I.sit.rxcrossroads.com", "https://www.portalbetaserony2i.sit.rxcrossroads.com"]
  bookmark_app_url = "https://www.portalbetaserony2i.sit.rxcrossroads.com"
  label  = "Actor ID"
  dataType = "string"
  required = "false"
  permissions = "READ_ONLY"
  appUser = "actorId"
  mapping = "String.len(user.actorId)>0?user.actorId:user.getInternalProperty('id')"
  }
}

org_whitelist_url = ["https://www.portalbetaserony2i.sit.rxcrossroads.com"]

claim = "actorId"
