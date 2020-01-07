provider "aws" {
    region = "eu-west-2"
    profile = "default"
}

data "aws_ssm_parameter" "latest_ami" {
    name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}


resource "aws_instance" "tf_instance" {
    ami = data.aws_ssm_parameter.latest_ami.value
    instance_type = "t2.micro"
    key_name = var.instance_key_name
    tags = {
        Name = var.instance_name
    }
    vpc_security_group_ids = [
        aws_security_group.tf_security_group.id
    ]
    iam_instance_profile = aws_iam_instance_profile.instance_profile.name
}