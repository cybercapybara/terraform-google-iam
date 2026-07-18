output "member_ids" {
  description = "Identifiers of the created IAM member bindings, keyed by role|member."
  value       = { for k, m in google_project_iam_member.this : k => m.id }
}

output "etags" {
  description = "Etags of the IAM policies for the created bindings."
  value       = { for k, m in google_project_iam_member.this : k => m.etag }
}
