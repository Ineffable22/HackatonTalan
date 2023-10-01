from pymongo import MongoClient


class Database:
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance.connect()
        return cls._instance

    def connect(self):
        self.client = MongoClient("mongodb://localhost:27017/")
        self.db = self.client["appDb"]

    def get_database(self):
        return self.db