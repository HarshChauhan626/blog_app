from fastapi import APIRouter

from app.api.api_v1.endpoints import blog, auth


api_router = APIRouter()
api_router.include_router(blog.router, prefix="/blogs", tags=["blogs"])
api_router.include_router(auth.router, prefix="/auth", tags=["auth"])



