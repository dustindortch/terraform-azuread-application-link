terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15"
    }
  }
}

data "azuread_client_config" "current" {}

resource "random_uuid" "app_id" {}

data "http" "logo" {
  count = var.logo_url != "" ? 1 : 0

  url = var.logo_url
}

resource "azuread_application" "link" {
  display_name     = var.name
  owners           = [data.azuread_client_config.current.object_id]
  sign_in_audience = "AzureADMyOrg"
  logo_image       = length(data.http.logo) > 0 ? data.http.logo[0].response_body_base64 : null

  web {
    homepage_url = var.url
  }

  app_role {
    id                   = random_uuid.app_id.id
    allowed_member_types = ["User"]
    description          = "User"
    display_name         = "User"
    enabled              = true
    value                = "User.All"
  }
}

resource "azuread_service_principal" "link" {
  application_id               = azuread_application.link.application_id
  app_role_assignment_required = var.requires_assignment

  login_url                     = azuread_application.link.web[0].homepage_url
  preferred_single_sign_on_mode = "notSupported"

  use_existing = true

  feature_tags {
    custom_single_sign_on = true
    enterprise            = true
    gallery               = false
  }
}

data "azuread_users" "users" {
  user_principal_names = var.user_principal_names
}

data "azuread_groups" "groups" {
  display_names = var.group_names
}

locals {
  users = {
    for user in data.azuread_users.users.users :
    user.user_principal_name => user
  }

  groups = {
    for group in data.azuread_groups.groups.display_names :
    group => {
      object_id = data.azuread_groups.groups.object_ids[index(data.azuread_groups.groups.display_names, group)]
    }
  }

  principals = merge(local.users, local.groups)
}

resource "azuread_app_role_assignment" "assignments" {
  for_each = local.principals

  app_role_id         = azuread_service_principal.link.app_role_ids["User.All"]
  principal_object_id = each.value.object_id
  resource_object_id  = azuread_service_principal.link.object_id
}
