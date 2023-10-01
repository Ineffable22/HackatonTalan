"""Initialize routing"""
from fastapi import APIRouter
from api.app.controllers.alert.v1.send_message import router as send_message

router = APIRouter()

router.include_router(send_message, prefix="/alert")
