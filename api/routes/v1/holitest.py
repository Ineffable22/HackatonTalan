"""TEST Module"""
from typing import Dict
from fastapi import APIRouter

router = APIRouter()


@router.get("/", status_code=200)
async def holi() -> Dict[str, str]:
    """Test function"""
    return {"message": "Hello World"}
