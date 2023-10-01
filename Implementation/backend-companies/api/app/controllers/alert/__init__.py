from fastapi import APIRouter
from api.app.controllers.alert.v1 import router as alert

router = APIRouter()

router.include_router(alert, prefix="/v1")
