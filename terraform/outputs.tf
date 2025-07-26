output "api_url" {
  value = "${aws_api_gateway_deployment.deployment.invoke_url}/greeting"
}

output "cognito_user_pool_id" {
  value = aws_cognito_user_pool.users.id
}

output "cognito_client_id" {
  value = aws_cognito_user_pool_client.client.id
}

output "ec2_public_ip" {
  value = aws_instance.api_server.public_ip
}
