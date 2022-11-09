# This repo is dedicated to configuring AWS services with terraform.

## Every IAM user is created with limited permissions. It's with an iam policy that general permissions are granted the admin and selected ones to other users. (check terraform or aws docs).

### After doing this, you you need attach the policy to the select user or group of users using the "aws_iam_policy_attachment" resource as this will guarantee its use.

## creating an s3 bucket resource block entails the bucket argument, tags and other metadata as you so choose.