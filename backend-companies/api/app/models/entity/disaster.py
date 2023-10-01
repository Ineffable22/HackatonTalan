from typing import List, Dict, Optional
from pydantic import BaseModel
from datetime import datetime

class Epicenter(BaseModel):
    lat: float
    lng: float

class SafeZone(BaseModel):
    lat: float
    lng: float

class ImpactArea(BaseModel):
    center: Epicenter
    radius: float

class Disaster(BaseModel):
    predicted_disaster: str
    confidence: float
    magnitude: float
    epicenter: Epicenter
    safe_zones: List[SafeZone]
    danger_level: int
    recommendations: List[str]
    impact_area: ImpactArea

