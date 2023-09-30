from fastapi import APIRouter

router = APIRouter()

@router.get("/")
async def holi():
    return {"message": "Hello World"}