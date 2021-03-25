
terraform {
  required_providers {
    okta = {
      source = "oktadeveloper/okta"
    }
  }
}
variable "vm_depends_on" {
  type    = any
  default = null
}

resource "okta_auth_server_scope" "authscope" {
  description    = "New RxC Metadata scope for RxC Portal specific elements"
  name           = "rxc-meta"
  auth_server_id = "default"
}



resource "okta_auth_server_claim" "authserver" {
  name           = var.claim
  status         = "ACTIVE"
  scopes         = ["rxc-meta"]
  claim_type     = "IDENTITY"
  value_type     = "EXPRESSION"
  value          = "appuser.actorId"
  auth_server_id = "default"
  depends_on     = [okta_auth_server_scope.authscope, var.vm_depends_on]
}
