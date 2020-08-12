variable "ok_groups" {
  type = map(object({
    description = string
    rule      = string
    admin_roles = string
  }))
}
