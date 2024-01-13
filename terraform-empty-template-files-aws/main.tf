# Random Password
resource "random_password" "password" {
  length           = 8
  upper            = false
  special          = false
  override_special = "!#$%&*()-_=+[]{}<>:?"
}
