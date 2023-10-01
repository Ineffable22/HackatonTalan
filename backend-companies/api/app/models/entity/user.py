from typing import Optional
from pydantic import BaseModel

class User(BaseModel):
    name: str
    email: str
    password: str
    lat: float
    long: float
    fcmtoken: Optional[str] = None