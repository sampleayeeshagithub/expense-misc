terraform {
  backend "s3" {
    bucket = "terraform-a75"
    key    = "misc/jenkins-ip/terraform.tfstate"
    region = "us-east-1"

  }
}

data "aws_instance" "instance" {
  instance_id = "i-05613177c0fc29946"
}

resource "aws_route53_record" "jenkins" {
   name = "jenkins.ayeeshadevops75.online"
   type = "A"
   zone_id = "Z0073724138YO075ETFE9"
   records = [data.aws_instance.instance.public_ip]
   ttl = 10
}

data "aws_instance" "artifactory" {
  instance_id = "i-08a4d4e1606062ca7"
}

resource "aws_route53_record" "artifactory" {
   name = "artifactory.ayeeshadevops75.online"
   type = "A"
   zone_id = "Z0073724138YO075ETFE9"
   records = [data.aws_instance.artifactory.public_ip]
   ttl = 10
}