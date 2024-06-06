#to configure created s3 bucket as backend to my project as it has versioning and also locked for 1 user at a time using dynamodb
#In google search (terraform s3 backend)
terraform {
    backend "s3" {
        bucket = "my-remote-s3-from-tf-6362117782"  #created bucket name
        key = "state/terraform.tfstate"   #path/to/my/key give any folder structure where .tfstate will be there
        region = "ap-south-1"  #region where our s3 is running
        dynamodb_table = "dynamodb-backend-locking"  #for locking (refer scrolling down in same document) and enter name of root_dynamodb_name for locking purpose
    }
}
