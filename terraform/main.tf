# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
    region = "us-east-2"
    access_key = "AKIAISWJGNS3VY6HQQVA"
    secret_key = "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"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair
resource "aws_key_pair" "k8s-kp" {
    key_name   = "lenovod"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBaRKDwH9oEMJCRiMs4abSl9T6oO9PDM519omJDltj9rFiewMINILqdlIQA3hDEEbshD1tjgdRCnrofwkjGtJbWS1LYFnMWHILx2XXRtUNwc4jGbUWu54CyvWf9Vyz+EE8Ly3coP61F5n3AvOs+hkpBvbcn1MNrC5CTWvBxpYj8xbBvUub1qwMtJDwwAV2Car5efuPH17rV/7Up2Qluf4wYLqfkOpJnJ3zhAluWBWLtn3rHjkXdWF0NR2KFS2d/XDtU3g8XCyek9h1XGSPze7K+MM9vhbighfJacy3o+lIWqE+8pwSeem//9ZOPdgZsP3M40gexUIJ7tt051g/03/5GPGCkAuvm8NfagXeQfY7fxh9yH1v0FWuoD2ZYz3Gq7ap0u00RRMWsN7ZgvpdEuLXjUJWELHZ89DuJDnyt5B08AXr/L1oRrRd1nszKteiHJ7yS2UjPhJbMuy8vY1Mkwqqr74Ze9R0j9zU7hHtOBZmoRw+2thgHHYfg918U3x7w1c= lenovo@DESKTOP-F30NHET"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "k8s-sg" {  
    name = "k8s-sg"
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 6443
        to_port     = 6443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 2379 
        to_port     = 2380
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 10250
        to_port     = 10250
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 10251 
        to_port     = 10251
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 10252 
        to_port     = 10252
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 30000
        to_port     = 32767
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
    }
} 

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "k8s-ec2" {
    ami = "ami-0dd9f0e7df0f0a138"
    instance_type = "t3.large"
    key_name = "lenovod"
    security_groups = ["k8s-sg"]
    tags = {
        Name = "k8s-ec2"
    }
}

# TODO: increase ebs on aws dash from 8gb to 30gb