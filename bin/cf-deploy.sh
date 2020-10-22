
# sync artifacts with s3
s3Bucket= ""
awsRegion=us-east-1
aws s3 sync ./ s3://${s3Bucket} --sse --delete --region ${awsRegion} \
--exclude "*" --include "*.yml" --include "*.sh"
