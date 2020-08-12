
provider "okta" {
  org_name  = var.org_name
  base_url  = var.base_url
  api_token = var.api_token
}

#
# data "okta_auth_server" "default" {
#   name = "default"
# }
#
# module "CreateCustomUserAttributes" {
#     source  = "../../../modules/components/CustomUserAttributes"
#     CustomUserAttributes = var.CustomUserAttributes
# }


module "AppGroups" {
    source  = "../../../modules/components/groups"
    ok_groups = var.ok_groups
}



module "AllOIDCapps" {
  source = "../../../modules/components/FRMPortalApp"
  //frm_redirect_url = ["http://localhost:8080"]
  oidc_apps = var.oidc_apps
  # groups =  module.AppGroups.AllGroupIds
  # vm_depends_on = [module.CreateCustomUserAttributes.Attribute]

  }

module "cors" {
  source = "../../../modules/components/CORS"
  org_whitelist_url = var.org_whitelist_url
}

# module "authserver" {
# source = "../../../modules/components/AuthServerClaim"
# claim = var.claim
# vm_depends_on = [module.CreateCustomUserAttributes.Attribute]
# }
