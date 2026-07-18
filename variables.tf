variable "project_id" {
  description = "ID of the project to which the IAM bindings are applied."
  type        = string
}

variable "bindings" {
  description = "Map of role to list of members. Each member is granted the role at the project level."
  type        = map(list(string))
  default     = {}
}
