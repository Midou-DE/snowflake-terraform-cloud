terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }
  backend "remote" {
    organization = "terraform_tuto"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB_Terra"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_schema" "demo_schema" {
  database = snowflake_database.demo_db.name
  name     = "DEMO_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"
}

resource "snowflake_schema" "demo_table" {
  database = snowflake_database.demo_db.name
  schema = snowflake_database.demo_db.demo_schema.name
  name     = "Table_DEMO_TERRA"
  comment  = "Table for Snowflake Terraform demo"
}



