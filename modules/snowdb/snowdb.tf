resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}
resource "snowflake_database" "new_db" {
  name    = "NEW_DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}
