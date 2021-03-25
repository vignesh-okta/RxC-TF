variable "org_name" {}
variable "base_url" {}
variable "api_token" {}

variable "CustomUserAttributes" {
  type = map(object({
     label = string
     dataType = string
     description = string
     required = string
     permissions = string
  }))
}

variable "oidc_apps" {
  type = map(object({
    redirect_urls = list(string)
    logout_redirect_urls = list(string)
  }))
}

variable "groups" {
  type = list(string)
}
variable "org_whitelist_url" {
  type = list(string)
}

