import boto3
dynamodb = boto3.resource('dynamodb')


def dynamodbHandler(event, context):
    table = dynamodb.Table('Music')
    table.put_item(
        Item={
            'Artist': 'Sid Sriram',
            'SongTitle': 'Nuvvunte Naa Jathagha',
            'Movie': 'I',
            'Year': 2015
        }
    )
    print('Item Created Successfully', table)
    response = table.get_item(
        Key={
            'Artist': 'Sid Sriram',
            'SongTitle': 'Nuvvunte Naa Jathagha'
        }
    )
    print(response['Item'])
    return response['Item']
