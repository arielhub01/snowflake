terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.61"
    }
  }
  backend "remote" {
    organization = "snow-tfc-github-org"

    workspaces {
      name = "snow-dev"
    }
  }
}

provider "snowflake" {
  account  = "XU93738.australiaeast.azure"
  user     = "${var.SNOWFLAKE_USER}"
  password = "${var.SNOWFLAKE_PASSWORD}"
  role     = "ACCOUNTADMIN"
  region   = "australiaeast.azure"
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_schema" "demo_schema" {
  database = snowflake_database.demo_db.name
  name     = "DEMO_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"
}