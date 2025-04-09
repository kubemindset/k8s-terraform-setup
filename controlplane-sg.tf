
resource "aws_security_group" "control_plane_sg" {
  name        = "k8s-control-plane-sg"
  description = "SG for Kubernetes Control Plane"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "control_plane_ports" {
   for_each          = { for port in var.control_plane_ports : tostring(port) => port }

  type                     = "ingress"
  from_port                = tonumber(each.value)
  to_port                  = tonumber(each.value)
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.bastion_sg.id
  security_group_id        = aws_security_group.control_plane_sg.id
}

resource "aws_security_group_rule" "nodeport_range" {
  type                     = "ingress"
  from_port                = 30000
  to_port                  = 32767
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.bastion_sg.id
  security_group_id        = aws_security_group.control_plane_sg.id
}
