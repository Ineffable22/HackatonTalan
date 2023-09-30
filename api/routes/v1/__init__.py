from fastapi import APIRouter

from api.routes.v1.holitest import holi

router = APIRouter()

router.include_router(holi)
