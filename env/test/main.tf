module "networking" {
  source = "../../"

  region = "ap-southeast-1"
  name = "test"
  cidr_blocks = [
    # base
    "10.0.0.0/16",
    # primary subnet
    "10.2.0.0/16",
    # secondary subnet
    "10.2.0.0/24"
  ]
}
