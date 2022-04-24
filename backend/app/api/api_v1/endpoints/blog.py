from typing import Any, Optional
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from app import crud
from app.api import deps
from app.api.deps import get_current_user
from app.schemas.tag import Tag
from app.models import User
from app.schemas.blog import Blog, BlogCreate, BlogBase, BlogCreateUtil, Blogs
from app.schemas.comment import PostCommentCreate, PostComment, PostCommentCreateUtil, PostComments
from app.schemas.like import PostLike, PostLikeCreate, PostLikeDelete

router = APIRouter()


@router.get("/{blog_id}", status_code=200, response_model=Blog)
def fetch_blog(
        *,
        blog_id: int,
        db: Session = Depends(deps.get_db),
        current_user: User = Depends(get_current_user)
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


@router.delete("/{blog_id}")
def delete_blog() -> Any:
    """Implement delete blog"""


@router.post("/{blog_id}/like", status_code=200, response_model=PostLike)
def post_like(*, obj_in: PostLikeCreate, db: Session = Depends(deps.get_db),
              current_user: User = Depends(get_current_user)) -> Any:
    result = crud.crud_post_like.create(db=db, post_like=obj_in)


@router.delete("/{blog_id}/like", status_code=200, response_model=PostLike)
def post_unlike(*, obj_in: PostLikeDelete, db: Session = Depends(deps.get_db),
                current_user: User = Depends(get_current_user)) -> Any:
    result = crud.crud_post_like.remove(db=db, post_unlike=obj_in)


@router.get("/{blog_id}/comment", status_code=200, response_model=PostComments)
def get_post_comments(*, db: Session = Depends(deps.get_db),
                      current_user: User = Depends(get_current_user)):
    """
    Get comments for specific blog post
    """


@router.post("/{blog_id}/comment", status_code=200, response_model=PostComment)
def post_comment(*, obj_in: PostCommentCreate, db: Session = Depends(deps.get_db),
                 current_user: User = Depends(get_current_user)) -> Any:
    post_comment_create = PostCommentCreateUtil(**obj_in.dict())
    post_comment_create.commenter_id = current_user.id
    result = crud.post_comment.create(db=db, obj_in=post_comment_create)
    return result


@router.delete("/{blog_id}/comment", status_code=200)
def delete_comment():
    """Implement delete comment"""


@router.post("/{blog_id}/report", status_code=200, response_model=Blog)
def report_blog() -> Any:
    """Implement report blog"""


@router.get("/search/", status_code=200, response_model=Blogs)
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


@router.get("/tags", status_code=200, response_model=Tag)
def get_tags(db: Session = Depends(deps.get_db), current_user: User = Depends(get_current_user)) -> Any:
    category_list = crud.tag.get(db=db)
    return category_list


@router.get("/feed", status_code=201, response_model=Blogs)
def get_feed() -> Any:
    """
    Implement user specific feed
    """


@router.get("/following")
def get_feed_by_followed() -> Any:
    """
    Get blogs from followed people
    """


@router.get("/recent")
def get_recently_viewed() -> Any:
    """Implement get recently viewed blogs"""
