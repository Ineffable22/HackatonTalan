from fastapi import APIRouter

router = APIRouter()

@router.get("", status_code=200)
async def get_data():
    return {"message": "Hello World"}
