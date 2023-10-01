from fastapi import APIRouter
from api.app.models.entity.user import User
from api.app.repositories.user import UserRepository

router = APIRouter()
userRepo = UserRepository()

@router.get("/all")
async def get_all_users():
    return userRepo.get_all()

@router.get("/{user_id}")
async def get_user_by_id(user_id: str):
    return userRepo.get_by_id(user_id)

@router.get("/{user_email}")
async def get_user_by_email(user_email: str):
    return userRepo.get_by_email(user_email)

@router.post("/register")
async def create_user(data_register: User):
    return userRepo.add(data_register)

@router.put("/update/{user_id}")
async def update_user(user_id: str, user_data: User):
    return userRepo.update(user_id, user_data)

@router.delete("/delete/{user_id}")
async def delete_user(user_id: str):
    return userRepo.delete(user_id)