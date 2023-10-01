"""Test Controller"""
from firebase.service.send_message import send_topic_push
from fastapi import APIRouter
# fcm_token = 'dpLM3ZRQS-O8a7yG8jzdvL:APA91bEyHKhKlFavXyOwqjSQ2fn0eD3TTkwVOJSav6txBT17Lf4rtsZxrlbBW5IJMZ9t97-Xsyzm1bUf-3ZGzPwkW10Wr1mfk--xv1D_VmlqN3OrNx93pp7QmKIp_poD67xMcRcGMIP0'

router = APIRouter()

@router.post("", status_code=200)
async def send_message(title: str, body: str, fcm_token: str):
    """Send a alert message"""
    return send_topic_push(title, body, fcm_token)
