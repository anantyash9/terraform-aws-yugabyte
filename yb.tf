module "yugabyte-db-cluster" {
  source = "github.com/anantyash9/terraform-aws-yugabyte"

  # The name of the cluster to be created.
  cluster_name = "yb"

  # Specify an existing AWS key pair
  # Both the name and the path to the corresponding private key file
  ssh_keypair = "SSH_KEYPAIR_HERE"     
  ssh_private_key = "SSH_KEY_PATH_HERE"

  # The existing vpc and subnet ids where the nodes should be spawned.
  region_name = "us-east-2"
  vpc_id = "vpc-04e5015ee4db58117"
  custom_security_group_id=""

  # Cluster data and metadata will be placed in separate AZs to ensure availability during single AZ failure if 3 AZs are specified.
  # To tolerate single AZ failure, the AZ count should be equal to RF.
  availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]
  subnet_ids = ["subnet-0d1a9b0767cf25b76", "subnet-03a2cdde77da94f74", "subnet-04be025943362b28b"]

  # Replication factor.
  replication_factor = "3"

  # The number of nodes in the cluster, this cannot be lower than the replication factor.
  num_instances = "3"
}