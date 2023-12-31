from fastapi import APIRouter, HTTPException
from api.app.models.dto.userModels import UserLoginDto
from api.app.services.user.userService import UserService

router = APIRouter()
userServ = UserService()

@router.post("")
async def user_login(user_login: UserLoginDto):
    try:
        return userServ.user_login(user_login)
    except HTTPException as ex:
        err_detail = ex.detail
        raise HTTPException(
            status_code = ex.status_code,
            detail = {
                "code": err_detail["code"],
                "message": err_detail["message"]
            }
        )
