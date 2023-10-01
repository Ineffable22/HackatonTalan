from api.config.server import create_config_app
from api.routes.routes import router

app = create_config_app()
app.include_router(router, prefix="/api")


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(
        app,
        host="0.0.0.0",
        port=8000
    )