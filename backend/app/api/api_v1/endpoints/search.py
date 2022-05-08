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
from app.schemas.blog import BlogResponse, BlogCreate, BlogBase, BlogCreateUtil, Blogs
from app.schemas.user import Users

router = APIRouter()


@router.get("/blogs/{keyword}", status_code=200, response_model=Blogs)
def search_blogs():
    """
    Search blogs
    """


@router.get("/user/{keyword}", status_code=200, response_model=Users)
def search_user(keyword: str, db: Session = Depends(deps.get_db),
                current_user: User = Depends(get_current_user)):
    """
    Search user with keyword
    """
    result=crud.user.search_user(db=db,keyword=keyword)
    return result


@router.get("/tags/{keyword}", status_code=200, response_model=Tag)
def search_tags():
    """
    Search tags
    """


@router.get("/collections/{keyword}", status_code=200, response_model=Collection)
def search_collection():
    """
    Search collections
    """
