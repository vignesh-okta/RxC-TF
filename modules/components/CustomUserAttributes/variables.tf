variable "CustomUserAttributes" {
  type = map(object({
     label = string
     dataType = string
     description = string
     required = string
     permissions = string
  }))
}
