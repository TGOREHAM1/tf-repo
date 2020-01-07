variable "instance_key_name" {
    description = "existing EC2 Key Pair"
    type = string
}

variable "instance_name" {
    description = "name of EC2 instance"
    type = string
}

variable "instance_allow_ssh" {
    description = "Whether or not to allow SSH"
    type = bool
    default = false
}
