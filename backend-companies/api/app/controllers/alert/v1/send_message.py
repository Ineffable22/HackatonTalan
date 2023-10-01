"""Test Controller"""
from firebase.service.send_message import send_topic_push
from fastapi import APIRouter
from api.app.services.alert.find_users import find_users
from api.app.services.alert.find_area import calculate_area
# fcm_token = 'dpLM3ZRQS-O8a7yG8jzdvL:APA91bEyHKhKlFavXyOwqjSQ2fn0eD3TTkwVOJSav6txBT17Lf4rtsZxrlbBW5IJMZ9t97-Xsyzm1bUf-3ZGzPwkW10Wr1mfk--xv1D_VmlqN3OrNx93pp7QmKIp_poD67xMcRcGMIP0'
import json

router = APIRouter()

@router.post("", status_code=200)
async def send_message(info: dict):
    """Send a alert message"""
    # disaster = {
    #         'predicted_disaster': predicted_disaster,
    #         'confidence': confidence,
    #         'magnitude': magnitude,
    #         'epicenter': epicenter,
    #         'safe_zones': safe_zones,
    #         'danger_level': danger_level,
    #         'recommendations': selected_recommendations,
    #         'impact_area': {'center': epicenter, 'radius': radius}  
    #}

    # lat_min = info.impact_area
    # lat_max = info.impact_area
    # long_min = info.impact_area
    # long_max = info.impact_area
    # radius = 
    # users = find_users(lat_min, lat_max, long_min, long_max)
    users = find_users()
    if users is []:
        return {"Message": "Unaffected area"}
    # WARNING: Cambiar el token de prueba por el token del usuario
    info_s = json.dumps(info)
    for user in users:
        send_topic_push(info.get('predicted_disaster', ""), info_s, user.get('fcm_token'))
    return {"Message": "Users informed"}
