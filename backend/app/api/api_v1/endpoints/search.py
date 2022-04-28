from fastapi import APIRouter
from typing import Any, Optional
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from app import crud
from app.api import deps
from app.api.deps import get_current_user
from app.schemas.collection import Collection
from app.schemas.tag import Tag
from app.models import User
from app.schemas.blog import Blog, BlogCreate, BlogBase, BlogCreateUtil, Blogs

router = APIRouter()


@router.get("/blogs", status_code=200, response_model=Blogs)
def search_blogs():
    """"""


@router.get("/user", status_code=200, response_model=Blogs)
def search_user():
    """"""


@router.get("/tags", status_code=200, response_model=Tag)
def search_tags():
    """"""


@router.get("/collections", status_code=200, response_model=Collection)
def search_collection():
    """"""
