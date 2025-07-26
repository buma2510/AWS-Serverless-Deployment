# Create API test script
cat <<EOF > /home/ec2-user/test_api.sh
#!/bin/bash
API_URL="$(aws ssm get-parameter --name "/greeting-api/url" --query "Parameter.Value" --output text)"
TOKEN=\$(aws cognito-idp initiate-auth \
  --client-id \$(aws ssm get-parameter --name "/greeting-api/cognito-client-id" --query "Parameter.Value" --output text) \
  --auth-flow USER_PASSWORD_AUTH \
  --auth-parameters USERNAME=user@example.com,PASSWORD=Passw0rd! | jq -r '.AuthenticationResult.IdToken')

curl -H "Authorization: Bearer \$TOKEN" "\$API_URL?name=EC2User"
EOF

chmod +x /home/ec2-user/test_api.sh
chown ec2-user:ec2-user /home/ec2-user/test_api.sh
