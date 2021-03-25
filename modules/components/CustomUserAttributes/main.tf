terraform {
  required_providers {
    okta = {
      source = "oktadeveloper/okta"
    }
  }
}
resource "okta_user_schema" "CustomUserAttributes" {
  for_each    =  var.CustomUserAttributes
  index       = each.key
  title       = each.value.label
  type        = each.value.dataType
  description = each.value.description
  required    = each.value.required
  permissions = each.value.permissions
  master      = "PROFILE_MASTER"
  # depends_on  = [okta_user_schema.CustomUserAttributes["portalId"]]
}
