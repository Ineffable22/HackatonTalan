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
            'Evacuar áreas bajas.',
            'Mover objetos valiosos a lugares altos.',
            'Evitar conducir o caminar a través de aguas de inundación.'
        ],
        'Earthquake': [
            'Ubicarse bajo una mesa o marco de puerta fuerte.',
            'Mantenerse alejado de ventanas y objetos que puedan caer.',
            'Permanecer en el interior hasta que haya pasado el temblor.'
        ],
        'Wildfire': [
            'Evacuar el área si se indica.',
            'Mantenerse alejado de áreas afectadas por el incendio.',
            'Usar una mascarilla N95 para filtrar partículas de humo del aire.'
        ],
        'None': [
            'Mantenerse informado y preparado.',
            'Tener un kit de emergencia disponible.',
            'Conocer las rutas de evacuación.'
        ]
    }
    peru_center = {'lat': -9.19, 'lng': -75.0152}  # Coordenadas aproximadas del centro de Perú
    
    while True:
        await asyncio.sleep(1)  
        predicted_disaster = random.choice(list(recommendations.keys()))
        confidence = random.random()
        magnitude = random.uniform(5.0, 9.0)
        
        # Generar un epicentro aleatorio en una región aproximada de Perú
        lat_variation = random.uniform(-2.0, 2.0)  # Variación de latitud
        lng_variation = random.uniform(-2.0, 2.0)  # Variación de longitud
        epicenter = {'lat': peru_center['lat'] + lat_variation, 'lng': peru_center['lng'] + lng_variation}
        
        # Área de impacto y zonas seguras
        radius = random.uniform(10.0, 100.0)  # Radio del área de impacto 
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

