provider "aws" {
  region = "us-east-1"  # Change this to your preferred region
}

# Input variables


variable "workspace_name" {
  description = "Name of the example resource bucket"
  type        = string
  default     = "example-workspace-bucket"
}




# Configure Terraform backend
terraform {
  backend "s3" {
    bucket         = "my-terraform-backend-bucket-12345" # Replace with your actual bucket name
    key            = "tfstate/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"             # Replace with your DynamoDB table name
    encrypt        = true
  }
}


# Example resource: Create an S3 bucket with parameterized workspace name
resource "aws_s3_bucket" "example_bucket" {
  bucket = var.workspace_name

  tags = {
    Name        = "Example Resource Bucket"
    Environment = "Dev"
  }
}
