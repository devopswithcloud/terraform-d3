# I want to create S3 buckets with for_each using maps


resource "aws_s3_bucket" "example" {
  for_each = {
    "dev"  = "boutique-micro-services"
    "qa"   = "boutique-micro-services-tst"
    "prod" = "boutique-micro-services-prd"
  }

  # dev-boutique-micro-services
  # qa-boutique-micro-services-tst
  # prod-boutique-micro-services-prd
  
  bucket = "${each.key}-${each.value}"

  tags = {
    Environment = each.key
  }
}
