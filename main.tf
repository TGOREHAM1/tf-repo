provider "aws" {
    region = "eu-west-2"
    profile = "default"
}

provider "aws" {
    region = "eu-west-1"
    alias = "euwest1"
    profile = "default"
}

resource "random_string" "instance_name" {
    length = 8
    special = false
}

module "instance" {
  source = "./modules/instance"
  instance_key_name = "cfn-kp"
  instance_name = "tf_instance"
  instance_allow_ssh = true
}

module "another_instance" {
  source = "./modules/instance"
  instance_key_name = "cfn-kp"
  instance_name = "tf_instance_${random_string.instance_name.result}"
  instance_allow_ssh = true
}

module "west1_instance" {
  source = "./modules/instance"
  instance_key_name = null
  instance_name = "tf_instance_${random_string.instance_name.result}"
  instance_allow_ssh = false
  providers = {
      aws = aws.euwest1
  }
}

output "instance_ip" {
    value = module.instance.instance_public_ip
}

output "another_instance_ip" {
  value = module.another_instance.instance_public_ip
}

output "west1_instance_ip" {
  value = module.west1_instance.instance_public_ip
}