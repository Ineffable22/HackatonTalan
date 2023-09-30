from fastapi import APIRouter
from api.app.controllers.user.v1.user import router as userCtrlV1
from api.app.controllers.data.v1.data import router as dataCtrlV1

router = APIRouter()

router.include_router(userCtrlV1, prefix="/user")
router.include_router(dataCtrlV1, prefix="/data")
