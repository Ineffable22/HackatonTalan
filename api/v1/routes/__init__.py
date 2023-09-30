from fastapi import APIRouter

from api.v1.routes import router as holi


router = APIRouter()

router.include_router(holi)