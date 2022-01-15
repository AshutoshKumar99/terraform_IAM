provider "aws" {
    region = "ap-south-1"
}

resource "aws_iam_user" "myuser" {
  name = "Ashish"
}

resource "aws_iam_policy" "custompolicy" {
  name        = "Ash_S3_EC2_Tagging"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:DeleteObjectTagging",
                "s3:DeleteJobTagging",
                "ec2:DeleteTags",
                "s3:PutBucketTagging",
                "s3:DeleteStorageLensConfigurationTagging",
                "ec2:CreateTags",
                "s3:ReplicateTags",
                "s3:PutStorageLensConfigurationTagging",
                "s3:PutObjectVersionTagging",
                "s3:PutObjectTagging",
                "s3:PutJobTagging",
                "s3:DeleteObjectVersionTagging"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "attachmenet" {
  name       = "policy-attachment"
  users      = [aws_iam_user.myuser.name]
  policy_arn = aws_iam_policy.custompolicy.arn
}