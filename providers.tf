provider "snowflake" {
  source      = "Snowflake-Labs/snowflake"
  version     = "0.92.0"
  account  = var.snowflake_acct
  user     = var.snowflake_username
  password = var.snowflake_password
  role     = "ACCOUNTADMIN"
  
}
