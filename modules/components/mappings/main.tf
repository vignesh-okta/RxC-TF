data "okta_user_profile_mapping_source" "user" {}

resource "okta_profile_mapping" "FRMMapping" {
  source_id          = "${data.okta_user_profile_mapping_source.user.id}"
  target_id          = "${okta_app_oauth.OIDCApp["FRMPortalApp"].id}"
  delete_when_absent = false

  mappings {
    id         = "actorId"
    expression = var.mapping
    push_status = "PUSH"
  }

}
