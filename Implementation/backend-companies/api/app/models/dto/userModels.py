from typing import Union

from pydantic import BaseModel

    
class UserLoginDto(BaseModel):
    email: str
    password: str
    fcmtoken: str