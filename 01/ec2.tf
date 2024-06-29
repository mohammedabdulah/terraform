resource "aws_instance" "sample" {
    ami= data.aws_ami.centos8.id
    count = 11
    instance_type= var.instance_name[count.index] == "mongodb" || var.instance_name[count.index] == "payment" || var.instance_name[count.index] == "shipping" ? "t3.small" : "t2.micro"
    tags = {
        Name = var.instance_name[count.index]
    }
}

resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  count = 11
  name    = "${var.instance_name[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.sample[count.index] == "web" ? aws_instance.sample[count.index].public_ip : aws_instance.sample[count.index].private_ip]
}