"""Firebase configuration"""
import firebase_admin
from firebase_admin import credentials, messaging


firebase_cred = credentials.Certificate('firebase.json')
firebase_app = firebase_admin.initialize_app(firebase_cred)


def send_topic_push(title: str, body: str, fcm_token: str):
    message = messaging.Message(
        notification=messaging.Notification(
            title=title,
            body=body
        ),
        topic='topic'
    )
    messaging.send(message)
send_topic_push("hola", "aaaabbbbbbbbbbbaaaaaa", "a")
