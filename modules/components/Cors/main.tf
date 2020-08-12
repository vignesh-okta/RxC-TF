resource "okta_trusted_origin" cors_id {
  for_each  = toset(var.org_whitelist_url)
  name   = each.value
  origin = each.value
  scopes = ["CORS", "REDIRECT"]
}
