variable "org_name" {}
variable "base_url" {}
variable "api_token" {}


variable "ok_groups" {
  type = map(object({
    description = string
    rule      = string
    admin_roles = string
  }))
}


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

variable "org_whitelist_url" {
  type = list(string)
}
