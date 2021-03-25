terraform {
  required_providers {
    okta = {
      source = "oktadeveloper/okta"
    }
  }
}

provider "okta" {
  org_name  = var.org_name
  base_url  = var.base_url
  api_token = var.api_token
}

module "CreateCustomUserAttributes" {
    source  = "../../modules/components/CustomUserAttributes"
    CustomUserAttributes = var.CustomUserAttributes
}

module "GetAppGroups" {
    source  = "../../modules/components/GetAppGroups"
    groups = var.groups
}

module "AllOIDCapps" {
  source = "../../modules/components/oauthApp"
  oidc_apps = var.oidc_apps
  groups =  values(module.GetAppGroups.name)[*].id
  }

 module "cors" {
  source = "../../modules/components/CORS"
  org_whitelist_url = var.org_whitelist_url
} 