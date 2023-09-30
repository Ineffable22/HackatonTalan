from fastapi import APIRouter


router = APIRouter()


@router.get("/", status_code=200)
async def holi():
    return {"message": "Hello World"}
