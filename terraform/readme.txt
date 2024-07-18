In order to create the resources in the correct order follow this steps:

1- Go to resources folder
2- terraform init -backend=false
3- terraform apply -auto-approve
4- Go to Terraform folder
5- terraform init -migrate-state
6- terraform apply -auto-approve

If you test then you must change the name of the s3bucket.
AWS takes a undetermined amount of time to allow a name to be reused.