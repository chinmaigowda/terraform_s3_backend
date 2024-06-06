variable "root_s3_bucket_name" {
    type = string
    default = "my-remote-s3-from-tf-6362117782"  #s3 name must be unique and no _ usage
}
variable "root_sse_encrytion" {
    type = string
    default = "AES256"  # AES256 is the fastest algorithm for sse always
}

variable "root_dynamodb_name" {
    type = string
    default = "dynamodb-backend-locking"
}
variable "root_dynamodb_hash_key" {
    type = string
    default = "LockID"  # Must be LockID (if not state locking will be disabled) as specified in tf official document that is mandatory
}