def userEntity(item) -> dict:
    return {
        "id": str(item["_id"]),
        "name": item["name"],
        "email": item["email"],
        "password": item["password"],
        "lat": item["lat"],
        "long": item["long"],
        "fcmtoken": item["fcmtoken"],
    }
    
def usersEntity(entity) -> list:
    return [userEntity(item) for item in entity]