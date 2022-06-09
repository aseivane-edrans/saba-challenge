output "Webserver-Public-IP" {
  value = aws_instance.webserver.public_ip
}

output "AWS-KMS-S3-Key" {
  value = data.aws_kms_key.s3.id
}