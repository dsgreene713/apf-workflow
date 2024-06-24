locals {
  // keep all locals related to account and ou provisioining here
  // for easy reference and upkeep
  org_admin_role_name = "APFLaunchPadAdminRole"

  ou_names = {
    apf_genesis = "apf-genesis"
  }

  ous = {
    (local.ou_names.apf_genesis) = {
      parent_id = data.aws_organizations_organization.this.roots[0].id
      tags      = merge(local.common_tags, { Name = local.ou_names.apf_genesis })
    }
  }

  account_names = {
    apf_launchpad = "apf-launchpad"
  }

  accounts = {
    (local.account_names.apf_launchpad) = {
      email          = "dsgreene713+${local.account_names.apf_launchpad}@gmail.com"
      role_name      = local.org_admin_role_name
      parent_ou_name = local.ou_names.apf_genesis
      tags           = merge(local.common_tags, { Name = local.account_names.apf_launchpad })
    }
  }
}

module "accounts" {
  source  = "app.terraform.io/blunatech-demo/organizations-wrapper/aws"
  version = "~> 1.0.0"

  organizational_units = local.ous
  accounts             = local.accounts
}