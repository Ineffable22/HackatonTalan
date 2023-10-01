from api.config.db import Database
from api.schemas.user import userEntity, usersEntity
from bson import ObjectId

db_instance = Database()
db = db_instance.get_database()
collection = db['users']

class UserRepository:
    def get_all(self):
        users = []
        cursor = collection.find({})
        if (cursor):
            users = usersEntity(cursor)
        return users
    
    def get_by_id(self, id: str):
        user = collection.find_one({'_id': ObjectId(id)})
        if (user):
            return userEntity(user)
        else:
            return None
    
    def get_by_email(self, email: str):
        user = collection.find_one({'email': email})
        if (user):
            return userEntity(user)
        else:
            return None
    
    def filter_one(self, key, value):
        if key == "id":
            user = collection.find_one({'_id': ObjectId(value)})
        else:
            user = collection.find_one({key: value})
        if (user):
            return userEntity(user)
        return None
    
    def filter_all(self, search: dict):
        users = []
        cursor = collection.find(search)
        if (cursor):
            users = usersEntity(cursor)
        return users

    def add(self, user):
        new_user = collection.insert_one(dict(user))
        created_user = collection.find_one({'_id': new_user.inserted_id})
        return userEntity(created_user)
    
    def update(self, id: str, user):
        collection.find_one_and_update({'_id': ObjectId(id)}, {'$set': dict(user)})
        document = collection.find_one({'_id': ObjectId(id)})
        return userEntity(document)
    
    def delete(self, id: str):
        collection.find_one_and_delete({'_id': id})
        return True