Warehouses
resource "snowflake_warehouse" "compute_wh" {
  name      = "COMPUTE_WH"
  size      = "XSMALL"
  auto_suspend = 60  # Auto suspend after 60 seconds of inactivity
  auto_resume  = true
}

resource "snowflake_warehouse" "etl_wh" {
  name      = "ETL_WH"
  size      = "SMALL"
  auto_suspend = 60  # Auto suspend after 60 seconds of inactivity
  auto_resume  = true
}

# Database
resource "snowflake_database" "sandbox_db" {
  name = "MY_SANDBOX_DB"
}

resource "snowflake_schema" "sandbox_schema" {
  name     = "MY_SCHEMA"
  database = snowflake_database.sandbox_db.name
}

# Roles
resource "snowflake_role" "account_admin" {
  name = "AccountAdmin"
}

resource "snowflake_role" "sys_admin" {
  name = "SysAdmin"
}

resource "snowflake_role" "security_admin" {
  name = "SecurityAdmin"
}

resource "snowflake_role" "dev_admin" {
  name = "DevAdmin"
}

resource "snowflake_role" "data_engineer" {
  name = "DataEngineer"
}

resource "snowflake_role" "analyst" {
  name = "Analyst"
}

resource "snowflake_role" "read_only" {
  name = "ReadOnly"
}

# Role Grants
resource "snowflake_role_grants" "account_admin_grants" {
  role_name  = snowflake_role.account_admin.name
  privileges = ["ALL"]
  on_account = true
}

resource "snowflake_role_grants" "sys_admin_grants" {
  role_name = snowflake_role.sys_admin.name
  privileges = [
    "CREATE DATABASE",
    "CREATE SCHEMA",
    "ALL PRIVILEGES"
  ]
  on {
    database = snowflake_database.sandbox_db.name
  }
}

resource "snowflake_role_grants" "security_admin_grants" {
  role_name = snowflake_role.security_admin.name
  privileges = [
    "CREATE USER",
    "CREATE ROLE"
  ]
  on_account = true
}

resource "snowflake_role_grants" "dev_admin_grants" {
  role_name = snowflake_role.dev_admin.name
  privileges = [
    "CREATE TABLE",
    "CREATE VIEW",
    "CREATE PROCEDURE",
    "CREATE TASK",
    "ALL PRIVILEGES"
  ]
  on {
    schema = snowflake_schema.sandbox_schema.name
  }
}

resource "snowflake_role_grants" "data_engineer_grants" {
  role_name = snowflake_role.data_engineer.name
  privileges = [
    "INSERT",
    "UPDATE",
    "DELETE",
    "CREATE TASK"
  ]
  on {
    schema = snowflake_schema.sandbox_schema.name
  }
}

resource "snowflake_role_grants" "analyst_grants" {
  role_name = snowflake_role.analyst.name
  privileges = [
    "SELECT",
    "CREATE VIEW"
  ]
  on {
    schema = snowflake_schema.sandbox_schema.name
  }
}

resource "snowflake_role_grants" "read_only_grants" {
  role_name = snowflake_role.read_only.name
  privileges = ["SELECT"]
  on {
    schema = snowflake_schema.sandbox_schema.name
  }
}

# Users and Role Assignments
resource "snowflake_user" "john" {
  name         = "john"
  password     = "password"
  default_role = snowflake_role.analyst.name
}

resource "snowflake_user" "jane" {
  name         = "jane"
  password     = "password"
  default_role = snowflake_role.data_engineer.name
}

resource "snowflake_role_grants" "john_role_grants" {
  role_name = snowflake_role.analyst.name
  users     = [snowflake_user.john.name]
}

resource "snowflake_role_grants" "jane_role_grants" {
  role_name = snowflake_role.data_engineer.name
  users     = [snowflake_user.jane.name]
}
