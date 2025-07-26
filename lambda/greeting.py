import json

def lambda_handler(event, context):
    # Extract query parameter
    name = event.get('queryStringParameters', {}).get('name', 'World')
    
    # Return greeting
    return {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*'
        },
        'body': json.dumps({
            'message': f"Hello, {name}!",
            'user': event.get('requestContext', {}).get('authorizer', {}).get('claims', {}).get('email', 'Unknown')
        })
    }
