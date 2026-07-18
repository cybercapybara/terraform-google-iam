locals {
  # Flatten role => members into individual member bindings keyed by "role|member".
  members = merge([
    for role, members in var.bindings : {
      for member in members : "${role}|${member}" => {
        role   = role
        member = member
      }
    }
  ]...)
}

resource "google_project_iam_member" "this" {
  for_each = local.members

  project = var.project_id
  role    = each.value.role
  member  = each.value.member
}
