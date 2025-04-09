
locals {
  instances = [
    {
      name              = "bastion-host"
      subnet_id         = var.public_subnet_id
      security_group_id = var.bastion_sg_id
    },
    {
      name              = "k8s-master"
      subnet_id         = var.private_subnet1_id
      security_group_id = var.control_plane_sg_id
    },
    {
      name              = "k8s-worker-1"
      subnet_id         = var.private_subnet2_id
      security_group_id = var.control_plane_sg_id
    },
    {
      name              = "k8s-worker-2"
      subnet_id         = var.private_subnet2_id
      security_group_id = var.control_plane_sg_id
    }
  ]
}

resource "aws_instance" "k8s_nodes" {
  for_each = { for inst in local.instances : inst.name => inst }

  ami                    = var.ubuntu_ami
  instance_type          = contains(["k8s-master", "k8s-worker-1", "k8s-worker-2"], each.key) ? "t2.medium" : "t2.micro"
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = [each.value.security_group_id]
  key_name               = var.key_name

  tags = {
    Name = each.key
  }

  root_block_device {
    volume_size = contains(["k8s-master", "k8s-worker-1", "k8s-worker-2"], each.key) ? 30 : 15
  }
}
