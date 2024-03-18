
resource "aws_s3_bucket" "bucketVPC" {
  bucket = "myaws1bucketgilbert"

  tags = {
    Name        = "My bucket"
    Environment = "elctriccal"
  }
}

