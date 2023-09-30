from fastapi import APIRouter
from api.app.controllers.user import router as userCtrl
from api.app.controllers.data import router as dataCtrl

router = APIRouter()

router.include_router(userCtrl, prefix="/user")
router.include_router(dataCtrl, prefix="/data")
