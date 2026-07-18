# terraform-google-iam

Terraform module that manages [Google Cloud](https://cloud.google.com/)
project-level IAM member bindings (`google_project_iam_member`). It takes a map
of role to members and grants each member the role using non-authoritative
member bindings.

## Usage

```hcl
module "iam" {
  source = "github.com/cybercapybara/terraform-google-iam"

  project_id = var.project_id

  bindings = {
    "roles/viewer" = ["group:team@example.com"]
    "roles/editor" = ["user:alice@example.com"]
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| google    | >= 5.0   |

## Inputs

| Name         | Description                                              | Type                | Default | Required |
|--------------|----------------------------------------------------------|---------------------|---------|:--------:|
| `project_id` | ID of the project to which the bindings are applied.     | `string`            | n/a     |   yes    |
| `bindings`   | Map of role to list of members.                          | `map(list(string))` | `{}`    |    no    |

## Outputs

| Name         | Description                                       |
|--------------|---------------------------------------------------|
| `member_ids` | Identifiers of the created member bindings.       |
| `etags`      | Etags of the IAM policies for the bindings.       |

## License

[MIT](LICENSE)
