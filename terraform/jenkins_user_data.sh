#!/bin/bash
set -e

# --- Java + Jenkins ---
dnf install -y java-17-amazon-corretto
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
dnf install -y jenkins
systemctl enable jenkins
systemctl start jenkins

# --- Docker (Jenkins needs it to build images) ---
dnf install -y docker
systemctl enable docker
systemctl start docker
usermod -aG docker jenkins
usermod -aG docker ec2-user

# --- AWS CLI v2 (usually preinstalled on AL2023, but ensure it's there) ---
dnf install -y aws-cli

# --- Git ---
dnf install -y git

# Restart Jenkins so the docker group membership takes effect
systemctl restart jenkins
