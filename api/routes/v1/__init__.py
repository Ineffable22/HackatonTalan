from fastapi import APIRouter

from api.routes.v1.get import router as holi

router = APIRouter()

router.include_router(holi)