import time
from pathlib import Path

from fastapi import FastAPI, APIRouter, Request, Depends
from sqlalchemy.orm import Session
from app.core.config import settings
from app.api.api_v1.api import api_router
import initial_data as init_data

import app.api.deps as deps

root_router = APIRouter()
app = FastAPI(title="Blog API", openapi_url=f"{settings.API_V1_STR}/openapi.json")


@root_router.get("/", status_code=200)
def root(
    request: Request,
    db: Session = Depends(deps.get_db),
) -> dict:
    """
    Root GET
    """
    return {"content":"hello world"}


@app.middleware("http")
async def add_process_time_header(request: Request, call_next):
    start_time = time.time()
    response = await call_next(request)
    process_time = time.time() - start_time
    response.headers["X-Process-Time"] = str(process_time)
    return response


app.include_router(api_router, prefix=settings.API_V1_STR)
app.include_router(root_router)

if __name__ == "__main__":
    # Use this for debugging purposes only
    import uvicorn

    init_data.main()

    uvicorn.run(app, port=8001, log_level="debug")
