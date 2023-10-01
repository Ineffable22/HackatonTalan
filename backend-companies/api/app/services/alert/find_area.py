from math import radians, pow, sqrt, cos, sin, asin


def calculate_area(lat1: float, long1: float, lat2: float, long2: float, max: float):
    """"Function to validate if the area is afected"""
    lat1 = radians(lat1)
    lat2 = radians(lat2)
    long1 = radians(long1)
    long2 = radians(long2)

    dlon = long2 - long1
    dlat = lat2 - lat1

    a = pow(sin(dlat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dlon / 2), 2)
    c = 2 * asin(sqrt(a))
    r = 6371

    distance = c * r
    return distance <= max
