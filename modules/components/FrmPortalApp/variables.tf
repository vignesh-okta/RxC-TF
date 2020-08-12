variable "oidc_apps" {
  type = map(object({
    redirect_urls = list(string)
    bookmark_app_url = string
    label = string
    dataType = string
    required = string
    permissions = string
    appUser = string
    mapping = string
  }))
}

variable "groups" {
  type = list(string)
}
