
provider "okta" {
  org_name  = var.org_name
  base_url  = var.base_url
  api_token = var.api_token
}

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
