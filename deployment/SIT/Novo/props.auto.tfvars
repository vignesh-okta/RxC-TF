# CustomUserAttributes = {
# "actorId" = {
#       label = "Actor ID"
#       dataType = "string"
#       description = "Actor ID attribute"
#       required = "false"
#       permissions = "HIDE"
#   },
#   "portalId" = {
#       label = "Portal ID"
#       dataType = "string"
#       description = "Portal ID attribute"
#       required = "false"
#       permissions = "HIDE"
#   }
# }

ok_groups = {
# "RxC_SIT_PORTAL_NovoFRM_EXT" = {
#   description = "External users assigned to FRM Portal"
#   rule = "user.portalId=='10018'"
#   admin_roles = ""
# },
"RxC_SIT_PORTAL_BetaPlusManufacturer_EXT" = {
  description = "External users assigned to Bayer Beta Plus Portal"
  rule = "user.portalId=='12001'"
  admin_roles = ""
},
"RxC_SIT_PORTAL_FreseniusManufacturer_EXT" = {
  description = "External users assigned to Fresenius Portal"
  rule = "user.portalId=='10010'"
  admin_roles = ""
},
"RxC_SIT_PORTAL_RelypsaFLT_EXT" = {
  description = "External users assigned to Relypsa Portal"
  rule = "user.portalId=='10013'"
  admin_roles = ""
}
}


oidc_apps = {
# "FRMPortalApp" = {
# redirect_urls = ["https://mcknordicarefrm.sit.rxcrossroads.com"]
# bookmark_app_url = "https://mcknordicarefrm.sit.rxcrossroads.com"
# label  = "Actor ID"
# dataType = "string"
# required = "false"
# permissions = "READ_ONLY"
# appUser = "actorId"
# mapping = "String.len(user.actorId)>0?user.actorId:user.getInternalProperty('id')"
# },
"BBPPortalApp" = {
redirect_urls = ["https://www.portalbetaseronY2I.sit.rxcrossroads.com", "https://www.portalbetaserony2i.sit.rxcrossroads.com"]
bookmark_app_url = "https://www.portalbetaserony2i.sit.rxcrossroads.com"
label  = "Actor ID"
dataType = "string"
required = "false"
permissions = "READ_ONLY"
appUser = "actorId"
mapping = "String.len(user.actorId)>0?user.actorId:user.getInternalProperty('id')"
},
"FreseniusPortalApp" = {
redirect_urls = ["https://www.velphoroaccesssolutionY2I.sit.rxcrossroads.com", "https://www.velphoroaccesssolutiony2i.sit.rxcrossroads.com"]
bookmark_app_url = "https://www.velphoroaccesssolutiony2i.sit.rxcrossroads.com"
label  = "Actor ID"
dataType = "string"
required = "false"
permissions = "READ_ONLY"
appUser = "actorId"
mapping = "String.len(user.actorId)>0?user.actorId:user.getInternalProperty('id')"
},
"RelypsaPortalApp" = {
redirect_urls = ["https://www.vkgatewayy2i.sit.rxcrossroads.com","https://www.vkgatewayY2I.sit.rxcrossroads.com/"]
bookmark_app_url = "https://www.vkgatewayy2i.sit.rxcrossroads.com"
label  = "Actor ID"
dataType = "string"
required = "false"
permissions = "READ_ONLY"
appUser = "actorId"
mapping = "String.len(user.actorId)>0?user.actorId:user.getInternalProperty('id')"
}

}

org_whitelist_url = ["https://www.portalbetaserony2i.sit.rxcrossroads.com/", "https://www.velphoroaccesssolutiony2i.sit.rxcrossroads.com/", "https://www.vkgatewayy2i.sit.rxcrossroads.com"]

# claim = "actorId"
