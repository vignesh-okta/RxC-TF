data "okta_policy" "password" {
  name = "Legacy Policy"
  type = "PASSWORD"
}

resource "okta_app_oauth" "OIDCApp" {
  for_each                   = var.oidc_apps
  label                      = each.key
  type                       = "browser"
  grant_types                = ["authorization_code"]
  redirect_uris              = each.value.redirect_urls
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
    ignore_changes = ["users", "groups"]
  }

}

variable "vm_depends_on" {
  type    = any
  default = null
}


resource okta_app_user_schema appUser {
  for_each = {
    for key, value in var.oidc_apps:
    key => value
    if value.appUser != ""
  }
  app_id    = "${okta_app_oauth.OIDCApp[each.key].id}"
  permissions = each.value.permissions
  title       = each.value.label
  type        = each.value.dataType
  required    = each.value.required
  index       =  each.value.appUser
  depends_on  = [okta_app_oauth.OIDCApp]

}

data "okta_user_profile_mapping_source" "user" {
  depends_on  = [okta_app_oauth.OIDCApp]
}



resource "okta_profile_mapping" "FRMMapping" {
for_each = {

  for key, value in var.oidc_apps:
  key => value
  if value.mapping != ""
}
  source_id          = "${data.okta_user_profile_mapping_source.user.id}"
  target_id          = "${okta_app_oauth.OIDCApp[each.key].id}"
  delete_when_absent = false

  mappings {
    id         = each.value.appUser
    expression = each.value.mapping
    push_status = "PUSH"
  }
  depends_on = [var.vm_depends_on, okta_app_oauth.OIDCApp]
}

# data "okta_group" "test" {
#   for_each = {
#     for key,value in var.oidc_apps:
#     for key in value.groups:
#     key => key
#   }
#   name = each.key
#   depends_on = [var.vm_depends_on, okta_app_oauth.OIDCApp]
# }

resource "okta_app_bookmark" "BookmarkApp" {
for_each = {
  for key, value in var.oidc_apps:
  key => value
  if value.bookmark_app_url != ""
}
  label  = "${each.key}Bookmark"
  url    = each.value.bookmark_app_url
  hide_web = true
  hide_ios = true
  groups=var.groups
  # groups = [data.okta_group.test[each.key].id]
  //groups = ["${okta_group.group.id}"]
  lifecycle {
    ignore_changes = ["users", "groups"]
  }
}

# output "upper_roles" {
#   # value = {for name, role in var.groups : upper(name) => upper(role)}
#   value = var.groups
# }
