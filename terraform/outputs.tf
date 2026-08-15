output "jenkins_public_ip" {
  description = "Public IP of the Jenkins server — visit http://<this-ip>:8080"
  value       = aws_instance.jenkins.public_ip
}

output "target_public_ip" {
  description = "Public IP of the deploy target — app will be at http://<this-ip>:5000"
  value       = aws_instance.target.public_ip
}

output "target_private_ip" {
  description = "Private IP of the target instance, for Jenkins to SSH into over the VPC"
  value       = aws_instance.target.private_ip
}

output "ecr_repository_url" {
  description = "ECR repo URL to push Docker images to"
  value       = aws_ecr_repository.app_repo.repository_url
}
