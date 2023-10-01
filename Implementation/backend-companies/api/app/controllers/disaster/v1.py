from fastapi import APIRouter
from api.app.models.entity.disaster import Disaster  
from api.app.repositories.disaster import DisasterRepository 

router = APIRouter()
disasterRepo = DisasterRepository()


@router.get("/all_disasters")
async def get_all_disasters():
    return disasterRepo.get_all()

@router.get("/disaster/{disaster_id}")
async def get_disaster_by_id(disaster_id: str):
    return disasterRepo.get_by_id(disaster_id)

@router.post("/add_disaster")
async def create_disaster(disaster_data: Disaster):
    return disasterRepo.add(disaster_data)

@router.put("/update_disaster/{disaster_id}")
async def update_disaster(disaster_id: str, disaster_data: Disaster):
    return disasterRepo.update(disaster_id, disaster_data)

@router.delete("/delete_disaster/{disaster_id}")
async def delete_disaster(disaster_id: str):
    return disasterRepo.delete(disaster_id)

