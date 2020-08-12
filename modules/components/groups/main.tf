
resource "okta_group" "AllOktaGroups" {
  for_each       = var.ok_groups
  name        = each.key
  description = each.value.description
}

resource okta_group_roles admin_roles {
  for_each = {
    for key, value in var.ok_groups:
    key => value
    if value.admin_roles != ""
  }

  group_id    = "${okta_group.AllOktaGroups[each.key].id}"
  admin_roles = each.value.admin_roles

}

resource "okta_group_rule" "AllGroupRules" {
  for_each = {
    for key, value in var.ok_groups:
    key => value
    if value.rule != ""
  }

    name              = "${each.key} "
    status            = "ACTIVE"
    group_assignments = ["${okta_group.AllOktaGroups[each.key].id}"]
    expression_type   = "urn:okta:expression:1.0"
    expression_value  = each.value.rule


}
