output "vpc_id" {
  description = "The ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "private_subnet_1_id" {
  value = module.vpc.private_subnet_1_id
}

output "private_subnet_2_id" {
  value = module.vpc.private_subnet_2_id
}

output "bastion_sg_id" {
  value = aws_security_group.bastion_sg.id
}

output "control_plane_sg_id" {
  value = aws_security_group.control_plane_sg.id
}
