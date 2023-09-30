from fastapi import APIRouter

from api.routes.v1 import router as holi


router = APIRouter()

router.include_router(holi, prefix="/v1", tags=["v1"])
