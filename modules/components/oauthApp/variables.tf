variable "oidc_apps" {
  type = map(object({
    redirect_urls = list(string)
    logout_redirect_urls = list(string)
  }))
}

variable "groups" {
  type = list(string)
}
