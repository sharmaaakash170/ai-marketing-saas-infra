terraform {
  backend "s3" {
    bucket = "eks-kafka-tf-state-7860290907"
    key = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "eks-kafka-tf-state-7860290907"
    encrypt = true
  }
}