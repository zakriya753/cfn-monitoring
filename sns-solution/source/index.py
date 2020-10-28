import json, boto3
sns = boto3.client('sns')
dynamodb = boto3.client('dynamodb')
def lambda_handler(event, context):
    alarmMessage=event['Records'][0]['Sns']['Message']
    alarmName=json.loads(alarmMessage)['AlarmName']
    print(alarmName)
    try: 
        dynamo = dynamodb.get_item(
        TableName='serverless-monitor-test',
        Key={
            'AlarmName': {'S': alarmName},
            }
        )
        #print(dynamo)
    except:
        raise Exception("Can't find alarmName field in dynamo table for {}".format(alarmName))
    try:
        sns.publish(
        TopicArn=dynamo['Item']['SNS_Topic']['S'],
        Subject='CloudWatch Alarm Alert',
        Message=dynamo['Item']['SNS_Message']['S'] )
    except:
        raise Exception("Missing required field SNS_Topic or SNS_Message in dynamo table for department {}".format(alarmName))
    return True      