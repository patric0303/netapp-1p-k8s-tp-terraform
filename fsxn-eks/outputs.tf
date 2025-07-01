output "kubernetes_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "_1_aws_kubeconfig_cmd" {
  description = "The aws command to run to load kubeconfig credentials"
  value       = "aws eks update-kubeconfig --region ${var.aws_region} --name ${aws_eks_cluster.eks_cluster.name}\n"
}

output "fsxn_password" {
  description = "The password for the FSxN admin user"
  sensitive = true
  value       = aws_secretsmanager_secret_version.fsx_password.secret_string
}

output "svm_password" {
  description = "The password for the SVM admin user"
  sensitive = true
  value       = aws_secretsmanager_secret_version.svm_password.secret_string
}