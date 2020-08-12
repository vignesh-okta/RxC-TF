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
"RxC_PROD_PORTAL_NovoFRM_EXT" = {
  description = "External users assigned to FRM Portal"
  rule = "user.portalId=='10018'"
  admin_roles = ""
}
}


oidc_apps = {
"FRMPortalApp" = {
redirect_urls = ["https://www.frm.nordicare.com"]
frm_bookmark_url = "https://www.frm.nordicare.com"
label  = "Actor ID"
dataType = "string"
required = "false"
permissions = "READ_ONLY"
appUser = "actorId"
mapping = "String.len(user.actorId)>0?user.actorId:user.getInternalProperty('id')"

}

}

org_whitelist_url = ["https://www.frm.nordicare.com"]

claim = "actorId"
