
terraform {
  required_providers {
    okta = {
      source = "oktadeveloper/okta"
    }
  }
}

resource "okta_app_oauth" "oidcapp" {
  for_each                   = var.oidc_apps
  label                      = each.key
  type                       = "browser"
  grant_types                = ["authorization_code"]
  redirect_uris              = each.value.redirect_urls
  post_logout_redirect_uris  = each.value.logout_redirect_urls
  response_types             = ["code"]
  token_endpoint_auth_method = "none"
  omit_secret                = true
  auto_submit_toolbar        = false
  hide_web                   = true
  hide_ios                   = true
  consent_method             = "TRUSTED"
  // This explicitly uses ID 0 of AllOktaGroupswithRules which should be spoke managed users
  groups                     = var.groups

  lifecycle {
    ignore_changes = [users]
  }

}

