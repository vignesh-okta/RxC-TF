variable "test_okta_users" {
  type = map(object({
    login = string
    email = string
    first_name = string
    last_name = string
    user_type = string
  }))
}