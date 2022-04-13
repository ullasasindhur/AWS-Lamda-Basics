import json
import os

def request_handler(event, context):
    print('event:',event)
    print('context:',context)
    print('os:',os.environ)
    message='Hello {} {}!'.format(event['firstname'],event['lastname'])
    return {
        'status': 'success',
        'message': message
    }