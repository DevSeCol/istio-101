import httpx
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "q": q}

@app.get("/test")
def read_nginx(svc: str = "nginx-svc"):
    request = httpx.get(f"http://{svc}")
    return {"response": request.text}

