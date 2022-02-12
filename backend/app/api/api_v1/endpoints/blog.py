import asyncio
from typing import Any, Optional

from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session

from app import crud
from app.api import deps
from app.api.deps import get_current_user
from app.models import User
from app.schemas.blog import Blog,BlogCreate,BlogSearchResults



router = APIRouter()


@router.get("/{blog_id}", status_code=200, response_model=Blog)
def fetch_blog(
    *,
    blog_id: int,
    db: Session = Depends(deps.get_db),
) -> Any:
    """
    Fetch a single recipe by ID
    """
    result = crud.blog.get(db=db, id=blog_id)
    if not result:
        # the exception is raised, not returned - you will get a validation
        # error otherwise.
        raise HTTPException(
            status_code=404, detail=f"Recipe with ID {blog_id} not found"
        )

    return result


@router.get("/search/", status_code=200, response_model=BlogSearchResults)
def search_blogs(
    *,
    keyword: str = Query(None, min_length=3, example="Something"),
    max_results: Optional[int] = 10,
    db: Session = Depends(deps.get_db),
) -> dict:
    """
    Search for recipes based on label keyword
    """
    blogs = crud.blog.get_multi(db=db, limit=max_results)
    results = filter(lambda blog: keyword.lower() in blog.label.lower(), blogs)

    return {"results": list(results)}


@router.post("/", status_code=201, response_model=Blog)
def create_blog(
    *, blog_in: BlogCreate, db: Session = Depends(deps.get_db),current_user:User=Depends(get_current_user)
) -> dict:
    """
    Create a new recipe in the database.
    """
    print(current_user)
    blog = crud.blog.create(db=db, obj_in=blog_in)

    return blog

