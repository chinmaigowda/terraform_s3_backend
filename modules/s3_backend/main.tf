#s3bucket creation with versioning and server side encryption

#1) s3 bucket creation (Search terraform s3 bucket in google)
resource "aws_s3_bucket" "s3_backend" {
    bucket = var.s3_bucket_name  #input variable to make bucket name dynamic
}

#2) Enabling versioning (search s3 in the search bar of same registry and then aws_s3_bucket_versioning)
resource "aws_s3_bucket_versioning" "s3_backen_versioning_enabled" {
    bucket = aws_s3_bucket.s3_backend.id #Implicitly used to create dependency to create versioning only after creation of s3 bucket
        #OR#
        #bucket = var.s3_bucket_name
        #depends_on = [ aws_s3_bucket.s3_backend ] ==> Explicitly specified by user to create versioning only after creation of s3 bucket
        #both - Implicit and explicit arguments are called meta arguments as they are defined by terraform and not aws cloud.
    versioning_configuration {
        status = "Enabled"
    }
}

#3) Creation of SSE (search s3 in the search bar of same registry and then aws_s3_bucket_server_side_encryption_configuration)
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_backend_sse" {
    bucket = aws_s3_bucket.s3_backend.id
    rule {
        apply_server_side_encryption_by_default {
            #kms_master_key_id = aws_kms_key.mykey.arn ==> As we do not need kms key rather we need sse.
            sse_algorithm = var.sse_encryption
        }
    }
}