#for bucket name
variable "s3_bucket_name" {
    type = string
    default = ""
}

#for sse key name
variable "sse_encryption" {
    type = string
    default = ""
}
