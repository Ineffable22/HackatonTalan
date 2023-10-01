"""Service to send push notification"""
from firebase_admin import messaging
from firebase.config import firebase_app
import json

def send_topic_push(title: str, body: dict, fcm_token: str):

    print(title)
    print(body)
    print(fcm_token)
    message = messaging.Message(
        notification=messaging.Notification(
            title=title,
            body=json.dumps(body)
        ),
        token=fcm_token
    )
    messaging.send(message)