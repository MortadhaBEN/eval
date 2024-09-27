# test_app.py

import pytest
from httpx import AsyncClient
from mini_groq import app  # Make sure to adjust this import according to your actual file structure

@pytest.mark.asyncio
async def test_get_status():
    async with AsyncClient(app=app, base_url="http://test") as client:
        response = await client.get("/status")
    
    assert response.status_code == 200
    assert response.json() == {"message": "OK"}
