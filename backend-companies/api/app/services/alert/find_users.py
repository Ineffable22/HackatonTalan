from api.app.repositories.user import UserRepository

# def find_users(lat_min, lat_max, long_min, long_max):
def find_users():
    instance = UserRepository()
    # conditions = {
    #     "lat": {"$gt": lat_min, "$lt": lat_max},
    #     "long": {"$gt": long_min, "$lt": long_max},
    # }
    # users = instance.filter_all(conditions)
    users = instance.filter_all()
    return users
