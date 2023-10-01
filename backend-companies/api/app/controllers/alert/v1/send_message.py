"""Test Controller"""
from firebase.service.send_message import send_topic_push
from fastapi import APIRouter
from api.app.services.alert.find_users import find_users
from api.app.services.alert.find_area import calculate_area
# fcm_token = 'dpLM3ZRQS-O8a7yG8jzdvL:APA91bEyHKhKlFavXyOwqjSQ2fn0eD3TTkwVOJSav6txBT17Lf4rtsZxrlbBW5IJMZ9t97-Xsyzm1bUf-3ZGzPwkW10Wr1mfk--xv1D_VmlqN3OrNx93pp7QmKIp_poD67xMcRcGMIP0'

router = APIRouter()

@router.post("", status_code=200)
async def send_message(info: dict):
    """Send a alert message"""
    users = find_users(lat_min, lat_max, long_min, long_max)
    if users is None:
        return {"Message": "Unaffected area"}
    
    for user in users:
        affect = calculate_area(lat_min, lat_max, long_min, long_max)
        if affect is True:
            send_topic_push(title, body, fcm_token)
    return {"Message": "Users informed"}
