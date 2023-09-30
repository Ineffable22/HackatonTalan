"""Service to send push notification"""
from firebase_admin import messaging
from firebase.config import firebase_app

def send_topic_push(title: str, body: str, fcm_token: str):
    message = messaging.Message(
        notification=messaging.Notification(
            title=title,
            body=body
        ),
        token=fcm_token
    )
    messaging.send(message)