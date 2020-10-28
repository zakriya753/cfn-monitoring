This solution is used for notifications through lambda whenever the alarm is triggered.

Pre-Requisite
SNS Topic and Create SNS subscription of lambda  after creating the  cfn stack from cfn folder ( it will create lambda and dynamodb).

Working
- The sns topic of alarms will trigger the lambda and the lambda will fetch the details from the dynamodb.
- The dynamodb will have the AlarmName and associated SNS_Topic, SNS_Message to send to that topic for that particular alarm.
- Make sure dynamodb table name is correct inside the lambda code in source folder.