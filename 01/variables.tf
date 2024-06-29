# variable "ami_id" {
#     type = string
#     default = "ami-0b4f379183e5706b9"
# }

variable "instance_name" {
    type = list
    default = ["web" , "mongodb" , "redis" , "mysql" , "rabbitmq" , "catalogue" , "user" , "cart" , "shipping" , "payment" , "dispatch"]
}

variable "domain_name" {
    type = string
    default = "littlesimba.online"
}

variable "zone_id" {
    type = string
    default = "Z02773932U4NB4GX343HA"
}