variable "group_names" {
  default     = []
  description = "The group display names to assign to the application.  Can be used with `user_principal_names` to assign both users and groups to the application."
  type        = list(string)
}

variable "logo_url" {
  default     = ""
  description = "The URL of the application logo"
  type        = string
}
variable "name" {
  description = "The name of the application"
  type        = string
}

variable "requires_assignment" {
  default     = true
  description = "If \"false\", users/groups do not need assignment to the application as it will be visible to all users in the directory."
  type        = bool
}

variable "url" {
  description = "The URL of the application"
  type        = string
}

variable "user_principal_names" {
  default     = []
  description = "The user principal names to assign to the application.  Can be used with `group_names` to assign both users and groups to the application."
  type        = list(string)
}
