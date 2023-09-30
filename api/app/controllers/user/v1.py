from fastapi import APIRouter

router = APIRouter()

@router.get("", status_code=200)
async def get_user():
    return {"message": "Hello World"}

@router.get("/{user_id}", status_code=200)
async def get_user_by_id(user_id: str):
    return {"message": f"Hello World: {user_id}"}
