from fastapi import APIRouter

from api.app.controllers.user.v1 import router as v1
# from api.app.controllers.user.v2 import router as v2

router = APIRouter()

router.include_router(v1, prefix="/v1")
# router.include_router(v2, prefix="/v2")