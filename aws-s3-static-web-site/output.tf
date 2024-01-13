
output "password_bcrypt_hash" {
  sensitive = true
  value     = random_password.password.bcrypt_hash
}

output "password_bcrypt_id" {
  value = random_password.password.id
}

output "password_bcrypt_result" {
  sensitive = true
  value     = random_password.password.result
}


output "static_web_site_url" {
  value = aws_s3_bucket_website_configuration.s3_bucket_website_configuration.website_endpoint
}
