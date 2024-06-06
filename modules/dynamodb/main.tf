# Creation of aws DynamoDB which is noSQL that is non-relational db (mongodb also belongs to the same)
#1) Search terraform aws dynamo db and land to resources and then aws_dynamodb_table
resource "aws_dynamodb_table" "dynamodb_resource" {
    name = var.dynamoDB_name
    billing_mode   = "PAY_PER_REQUEST"  #pay per request as (not frequent) we don't want any reserved/PROVISIONED db for a mont or a period of time so
    hash_key = var.hash_key_dynamodb
    attribute {
        name = var.hash_key_dynamodb  #same name as hash-key
        type = "S" #In dynamodb S means string
    }
}