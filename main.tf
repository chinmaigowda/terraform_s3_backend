#to call the child modules for execution
#1) to call s3_backend module
module "root_create_s3_backend" {
    source = "./modules/s3_backend"
    s3_bucket_name = var.root_s3_bucket_name  #(variable_name_from_module = variable_from_root) to enter the input variable ==> name
    sse_encryption = var.root_sse_encrytion  #(variable_name_from_module = variable_from_root) to enter the input variable ==> sse encryption name
}

#2) to call dynamodb module
module "root_create_dynamodb" {
    source = "./modules/dynamodb"
    dynamoDB_name = var.root_dynamodb_name  #(variable_name_from_module = variable_from_root)
    hash_key_dynamodb = var.root_dynamodb_hash_key  #(variable_name_from_module = variable_from_root)
}