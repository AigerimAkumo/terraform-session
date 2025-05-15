locals {
  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
  public_subnet_ids  = data.terraform_remote_state.vpc.outputs.public_subnet_ids
  private_subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids

  # Naming & Tagging standard
  common_tags = {
    Environment   = var.env
    Project       = var.project
    Business_Unit = var.business_unit
    Team          = var.team
    Owner         = var.owner
    Managed_By    = var.managed_by
    Market        = "us"
  }
}
