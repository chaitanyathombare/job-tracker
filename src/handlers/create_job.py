import json
import uuid
import boto3 
from datetime import datetime

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('jobs')

def handler(event, context):

    print("EVENT:", json.dumps(event))  # debug

    body = json.loads(event['body'])
    
     # 🛡️ Safe parsing
    if not body:
        return {
            "statusCode": 400,
            "body": json.dumps({"error": "Request body is empty"})
        }

    if isinstance(body, str):
        try:
            body = json.loads(body)
        except json.JSONDecodeError:
            return {
                "statusCode": 400,
                "body": json.dumps({"error": "Invalid JSON format"})
            }

    # Validate required fields
    if not body.get('company') or not body.get('role'):
        return {
            "statusCode": 400,
            "body": json.dumps({"error": "Missing company or role"})
        }


    job_id = str(uuid.uuid4())
    user_id = "demo-user"  # replace later with Cognito

    item = {
        'user_id': user_id,
        'job_id': job_id,
        'company': body['company'],
        'role': body['role'],
        'status': 'Applied',
        'created_at': datetime.utcnow().isoformat()
    }

    table.put_item(Item=item)

    return {
        "statusCode": 201,
        "body": json.dumps(item)
    }