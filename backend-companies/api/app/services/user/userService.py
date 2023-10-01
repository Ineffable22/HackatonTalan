from fastapi import HTTPException
from api.app.models.dto.userModels import UserLoginDto
from api.app.models.entity.user import User
from api.app.repositories.user import UserRepository

userRepo = UserRepository()

class UserService:
    def user_login(self, user_login: UserLoginDto):
        user = userRepo.get_by_email(user_login.email)
        if (not user):
            error_message = "El correo Ingresado no es valido"
            raise HTTPException(status_code=500, detail={"error_code": "050", "error_message": error_message})
        
        if (user_login.password != user["password"]):
            error_message = "La contraseña ingresada no es correcta"
            raise HTTPException(status_code=500, detail={"error_code": "050", "error_message": error_message})
        
        if ((not user["fcmtoken"]) or (user["fcmtoken"] == "") or (user["fcmtoken"] != user_login.fcmtoken)):
            user = userRepo.update(user["id"], {"fcmtoken": user_login.fcmtoken})
            
        return user