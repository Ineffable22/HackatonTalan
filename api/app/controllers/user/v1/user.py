from fastapi import APIRouter

router = APIRouter()

@router.get("", status_code=200)
async def get_user():
    return {"message": "Hello World"}
