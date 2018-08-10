module "infrastructure" {
  source = "./modules/infrastructure"

  platform_name = "${var.platform_name}"

  platform_vpc_id    = "${module.network.platform_vpc_id}"
  public_subnet_ids  = ["${module.network.public_subnet_ids}"]
  private_subnet_ids = ["${module.network.private_subnet_ids}"]

  operator_cidrs      = ["${var.operator_cidrs}"]
  public_access_cidrs = ["${var.public_access_cidrs}"]

  master_public_dns_name     = "${var.platform_default_subdomain}"
  platform_default_subdomain = "${var.platform_default_subdomain}"

  master_count          = "${var.master_count}"
  compute_node_count    = "${var.compute_node_count}"
  infra_node_count      = "${var.infra_node_count}"
  master_instance_type  = "${var.master_instance_type}"
  compute_instance_type = "${var.compute_instance_type}"
  infra_instance_type   = "${var.infra_instance_type}"
  master_spot_price     = "${var.master_spot_price}"

  key_pair_private_key = "${file(var.key_pair_private_key_path == "" ? "${path.module}/empty.txt" : var.key_pair_private_key_path)}"

  upstream                = "${var.upstream}"
  openshift_major_version = "${var.openshift_major_version}"
  rh_subscription_pool_id = "${var.rh_subscription_pool_id}"
  rhn_username            = "${var.rhn_username}"
  rhn_password            = "${var.rhn_password}"

  node_image_id = "${var.node_image_id}"
  bastion_image_id = "${var.bastion_image_id}"
}
