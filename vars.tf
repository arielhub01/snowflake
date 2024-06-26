variable "snowflake_user" {
  description = "User"
  type        = string
  sensitive   = true
  default     = ""
}
variable "snowflake_password" {
  description = "Password"
  type        = string
  sensitive   = true
  default     = ""
}
variable "snowflake_acct" {
  description = "Account"
  type        = string
  sensitive   = true
  default     = ""
}