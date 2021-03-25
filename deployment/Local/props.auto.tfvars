CustomUserAttributes = {
"imp_username" = {
      label = "Impersonation ID"
      dataType = "string"
      description = "Impersonation ID attribute"
      required = "false"
      permissions = "HIDE"
  }
}

oidc_apps = {
  "Cloudok Login" = {
    redirect_urls = ["http://localhost:44367","https://cloudok.ga"]
    logout_redirect_urls = ["http://localhost:44367/logout","https://cloudok.ga/logout"]
  }
}

groups = ["Everyone"]

org_whitelist_url = ["http://localhost:44367","https://cloudok.ga"]