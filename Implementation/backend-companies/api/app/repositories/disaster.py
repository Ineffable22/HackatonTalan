from bson import ObjectId
from datetime import datetime
from api.config.db import Database

db_instance = Database()
db = db_instance.get_database()
collection = db['disasters']

class DisasterRepository:
    def add(self, disaster):
        disaster_dict = disaster.dict()
        disaster_dict['epicenter'] = disaster.epicenter.dict()
        disaster_dict['impact_area']['center'] = disaster.impact_area.center.dict()
        disaster_dict['safe_zones'] = [zone.dict() for zone in disaster.safe_zones]
        
        # Insertar el diccionario en MongoDB
        result = collection.insert_one(disaster_dict)
        
        # Obtener el documento insertado
        created_disaster = collection.find_one({'_id': result.inserted_id})
        
        # Convertir el ObjectId a str
        created_disaster['_id'] = str(created_disaster['_id'])
        
        return created_disaster 
    
    def get_all(self):
        cursor = collection.find({})
        disasters = []
        for disaster in cursor:
            disaster['_id'] = str(disaster['_id'])  # Convertir ObjectId a string
            disasters.append(disaster)
        return disasters
    def get_by_id(self, id: str):
        disaster = collection.find_one({'_id': ObjectId(id)})
        return disaster  # Retorna el desastre encontrado
    
    def update(self, id: str, disaster):
        collection.find_one_and_update({'_id': ObjectId(id)}, {'$set': dict(disaster)})
        updated_disaster = collection.find_one({'_id': ObjectId(id)})
        return updated_disaster  # Retorna el desastre actualizado
    
    def delete(self, id: str):
        collection.find_one_and_delete({'_id': ObjectId(id)})
        return True  # Retorna True si el desastre fue eliminado

# Para usar el repositorio:
# db_instance = Database()
# db = db_instance.get_database()
# disaster_repo = DisasterRepository(db)
# new_disaster = disaster_repo.add(disaster)

