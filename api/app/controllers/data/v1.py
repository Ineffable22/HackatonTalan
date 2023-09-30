from fastapi import APIRouter

router = APIRouter()

@router.get("", status_code=200)
async def get_data():
    return {"message": "Hello Data"}

@router.get("/{data_code}", status_code=200)
async def get_user_by_id(data_code: str):
    return {"message": f"Hello Data: {data_code}"}
