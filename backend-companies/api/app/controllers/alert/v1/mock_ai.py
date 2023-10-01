#!/usr/bin/env python3

from fastapi import FastAPI, WebSocket
from fastapi.responses import HTMLResponse
import random
import asyncio
import httpx

app = FastAPI()

async def generate_mock_disaster():
    recommendations = {
        'Flood': [
            'Evacuate low areas.',
            'Move valuable objects to high places.',
            'Avoid driving or walking through floodwaters.'
        ],
        'Earthquake': [
            'Position yourself under a sturdy table or door frame.',
            'Stay away from windows and objects that may fall.',
            'Remain indoors until the shaking has passed.'
        ],
        'Wildfire': [
            'Evacuate the area if instructed.',
            'Stay away from areas affected by the fire.',
            'Use an N95 mask to filter smoke particles from the air.'
        ],
        'None': [
            'Stay informed and prepared.',
            'Have an emergency kit available.',
            'Know the evacuation routes.'
        ]
    }
    peru_center = {'lat': -9.19, 'lng': -75.0152}  # Approximate coordinates of the center of Peru
    
    while True:
        await asyncio.sleep(1)  
        predicted_disaster = random.choice(list(recommendations.keys()))
        confidence = random.random()
        magnitude = random.uniform(5.0, 9.0)
        
        # Generate a random epicenter in an approximate region of Peru
        lat_variation = random.uniform(-2.0, 2.0)  # Latitude variation
        lng_variation = random.uniform(-2.0, 2.0)  # Longitude variation
        epicenter = {'lat': peru_center['lat'] + lat_variation, 'lng': peru_center['lng'] + lng_variation}
        
        # Impact area and safe zones
        radius = random.uniform(10.0, 100.0)  # Radius of the impact area
        safe_zones = [
            {'lat': epicenter['lat'] + radius/111 + 0.1, 'lng': epicenter['lng'] + radius/111 + 0.1},
            {'lat': epicenter['lat'] - radius/111 - 0.1, 'lng': epicenter['lng'] - radius/111 - 0.1}
        ]
        
        danger_level = random.randint(1, 5)
        selected_recommendations = recommendations[predicted_disaster]
        
        disaster = {
            'predicted_disaster': predicted_disaster,
            'confidence': confidence,
            'magnitude': magnitude,
            'epicenter': epicenter,
            'safe_zones': safe_zones,
            'danger_level': danger_level,
            'recommendations': selected_recommendations,
            'impact_area': {'center': epicenter, 'radius': radius}  
        }
        
        if confidence > 0.9 and predicted_disaster != 'None':
            yield disaster


async def notify_disaster():
    async for disaster in generate_mock_disaster():
        async with httpx.AsyncClient() as client:
            response = await client.post('http://localhost:8000/send_message', json=disaster) 

@app.on_event("startup")
async def startup_event():
    asyncio.create_task(notify_disaster())

