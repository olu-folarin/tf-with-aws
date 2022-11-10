# This repo is dedicated to configuring AWS services with terraform.

## Every IAM user is created with limited permissions. It's with an iam policy that general permissions are granted the admin and selected ones to other users. (check terraform or aws docs).

### After doing this, you you need attach the policy to the select user or group of users using the "aws_iam_policy_attachment" resource as this will guarantee its use.

## creating an s3 bucket resource block entails the bucket argument, tags and other metadata as you so choose.
### To store objects in the bucket, you need create an aws_s3_bucket_object resource which takes 3 arguments:
####    bucket to connect to
####    bucket name (key)
####    object path

## To store data, a database of choice on aws is dynamodb. You create it with the aws_dynamodb_table resource along with all its arguments. Note that its primary key is the hash_key key.
#### In order to add data to the db, you use the aws_dynamodb_table_item which takes the name of the table created ealier as well as its hash_key and a json file which contains the data its meant for.
#### For actual formatting, check the main.tf file.