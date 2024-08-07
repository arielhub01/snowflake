terraform {
   required_providers {
     snowflake = {
       source  = "Snowflake-Labs/snowflake"
       version = "0.87.3-pre"
     }
   }
}

provider "snowflake" {
  account  = var.snowflake_acct
  user     = var.snowflake_username
  password = var.snowflake_password
  role     = "ACCOUNTADMIN"
  
}
