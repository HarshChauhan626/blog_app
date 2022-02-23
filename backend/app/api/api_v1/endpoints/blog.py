import asyncio
from typing import Any, Optional

from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session

from app import crud
from app.api import deps
from app.api.deps import get_current_user
from app.models import User
from app.schemas.blog import Blog, BlogCreate, BlogSearchResults
from app.schemas.comment import PostCommentCreate, PostComment
from app.schemas.like import PostLike, PostLikeCreate, PostLikeDelete

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


@router.post("/like", status_code=200, response_model=PostLike)
def post_like(*, obj_in: PostLikeCreate, db: Session = Depends(deps.get_db)) -> Any:
    result = crud.crud_post_like.create(db=db, post_like=obj_in)


@router.post("/unlike", status_code=200, response_model=PostLike)
def post_unlike(*, obj_in: PostLikeDelete, db: Session = Depends(deps.get_db)) -> Any:
    result = crud.crud_post_like.remove(db=db, post_unlike=obj_in)


@router.post("/comment", status_code=200, response_model=PostComment)
def post_comment(*, obj_in: PostCommentCreate, db: Session = Depends(deps.get_db)) -> Any:
    result = crud.crud_post_comment.create(db=db, post_comment=obj_in)


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
        *, blog_in: BlogCreate, db: Session = Depends(deps.get_db), current_user: User = Depends(get_current_user)
) -> dict:
    """
    Create a new recipe in the database.
    """
    print(current_user)
    blog = crud.blog.create(db=db, obj_in=blog_in)
    blog_id = blog.id
    for tag in blog_in.tags:
        crud.post_tag.create(db=db, title=tag, blog_id=blog_id)

    return blog
