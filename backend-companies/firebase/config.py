"""Firebase configuration"""
import firebase_admin
from firebase_admin import credentials

firebase_cred = credentials.Certificate('firebase/firebase.json')
firebase_app = firebase_admin.initialize_app(firebase_cred)
