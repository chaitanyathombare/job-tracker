import json
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('jobs')

def handler(event, context):

    print(event)
    
    headers = {
        "Content-Type": "application/json"
    }

    user_id = "demo-user"

    
    response = table.query(
        KeyConditionExpression="user_id = :uid",
        ExpressionAttributeValues={":uid": user_id}
    )

    return {
        "statusCode": 200,
        "body": json.dumps(response['Items'])
    }