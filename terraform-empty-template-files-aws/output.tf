
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



