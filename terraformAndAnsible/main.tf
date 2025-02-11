terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-00c257e12d6828491"
  instance_type = "t2.micro"
  key_name      = "multivac-iac"
  # user_data     = <<-EOF
  #                    #!/bin/bash
  #                    cd /home/ubuntu
  #                    echo "<h1>Terraform made static file</h1>" > index.html
  #                    nohup busybox httpd -f -p 8080 &
  #                    EOF
  # user_data_replace_on_change = true
  tags = {
    Name = "Terraform - Python via Ansible"
  }

}
