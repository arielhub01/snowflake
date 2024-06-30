terraform {
   required_providers {
     snowflake = {
       source  = "Snowflake-Labs/snowflake"
       version = "0.87.3-pre"
     }
   }
}

provider "snowflake" {
  account  = "XU93738"
  user     ="SNOWFLAKE"
  password = var.snowflake_password
  role     = "ACCOUNTADMIN"
  
}
