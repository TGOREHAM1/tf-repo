provider "aws" {
    region = "eu-west-2"
    profile = "default"
}

resource "aws_instance" "tf_instance" {
    ami = "ami-05f37c3995fffb4fd"
    instance_type = "t2.micro"
    key_name = var.instance_key_name
    tags = {
        Name = var.instance_name
    }
}