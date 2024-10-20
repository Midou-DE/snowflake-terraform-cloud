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
  name    = "DEMO_SCH"
  comment = " create first schema for Snowflake Terraform demo"
}


