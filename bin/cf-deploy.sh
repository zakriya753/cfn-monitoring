
# sync artifacts with s3
s3Bucket="serverless-cfn-artifacts-bucket"
awsRegion=us-east-1
aws s3 sync ./ s3://$s3Bucket --sse --delete --region $awsRegion \
--exclude "*" --include "*.yml" --include "*.sh" --profile sl-cw



# Serveless Main Create
awsRegion=us-east-1
awsEnv=dev
s3ArtifactPath="serverless-cfn-artifacts-bucket/cfn/modules"
aws cloudformation create-stack --stack-name sl-monitoring-$awsEnv-$awsRegion --region $awsRegion \
--template-body file://sl-cw-main.yml \
--parameters ParameterKey=awsEnv,ParameterValue=$awsEnv ParameterKey=s3ArtifactPath,ParameterValue=$s3ArtifactPath \
--capabilities CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND --profile sl-cw