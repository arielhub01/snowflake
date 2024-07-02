provider "snowflake" {
  account  = var.snowflake_acct
  user     = var.snowflake_username
  password = var.snowflake_password
  role     = "ACCOUNTADMIN"
  host    = "XU93738.australiaeast.azure.snowflakecomputing.com"
   
}
