#!/bin/bash

echo "Deploying infrastructure..."
cd terraform
terraform init
terraform apply -auto-approve

echo "Creating test user..."
aws cognito-idp sign-up \
  --client-id $(terraform output -raw cognito_client_id) \
  --username user@example.com \
  --password Passw0rd! \
  --user-attributes Name=email,Value=user@example.com

echo "Verifying user..."
aws cognito-idp admin-confirm-sign-up \
  --user-pool-id $(terraform output -raw cognito_user_pool_id) \
  --username user@example.com

echo "Deployment complete!"
echo "API URL: $(terraform output -raw api_url)"
echo "EC2 Public IP: $(terraform output -raw ec2_public_ip)"
