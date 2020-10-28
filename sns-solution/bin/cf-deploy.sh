# Cloudformation Create
aws cloudformation create-stack --stack-name sl-monitor-cfn-dev \
--template-body file://cw-notif-app.yml \
--parameters ParameterKey=awsEnv,ParameterValue=dev ParameterKey=appName,ParameterValue=sl-monitor ParameterKey=dynamoTableName,ParameterValue=sl-monitor \
ParameterKey=snsTopicAlarmArn,ParameterValue="" \
ParameterKey=s3Bucket,ParameterValue="" ParameterKey=s3LambdaKey,ParameterValue="" \
--tags Key=Name,Value=sl-monitor Key=awsEnv,Value=dev \
--capabilities CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND