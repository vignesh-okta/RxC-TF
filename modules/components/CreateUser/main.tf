terraform {
  required_providers {
    okta = {
      source = "oktadeveloper/okta"
      version = "3.7.4"
    }
  }
}
resource "okta_user" "test_okta_users" {
    for_each    = var.test_okta_users
    # index       = "Test property"
    # title       = "Test property"
    # type        = "oty2150y6ul6YfJv64x7"
    # description = "My custom property name"
    # master      = "OKTA"
    # scope       = "SELF"
    # index   = "oty2150y6ul6YfJv64x7"
    user_type   = each.value.user_type
    login       = each.value.login
    email       = each.value.email
    first_name  = each.value.first_name
    last_name   = each.value.last_name

}