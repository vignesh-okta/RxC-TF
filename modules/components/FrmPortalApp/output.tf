
output "Policy" {
  value       = data.okta_policy.password
  description = "Okta Password Policy"
}

output "Client_Id" {
  value    = okta_app_oauth.OIDCApp
  description = "Application details"
}

output "BookmarkAppInfo" {
  value = okta_app_bookmark.BookmarkApp
  description = "Bookmark Application details"
}
