provider "snowflake" {
  account  = "XU93738.australia-east.azure"
  user     = var.snowflake_username
  password = var.snowflake_password
  role     = "ACCOUNTADMIN"
  request_timeout = 10
    
}
