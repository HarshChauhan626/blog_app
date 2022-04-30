from typing import Any, Optional
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from app import crud
from app.api import deps
from app.api.deps import get_current_user
from app.schemas.responses import CollectionResponse
from app.schemas.tag import Tag
from app.models import User
from app.schemas.blog import Blog, BlogCreate, BlogBase, BlogCreateUtil, Blogs
from app.schemas.comment import PostCommentCreate, PostComment, PostCommentCreateUtil, PostComments
from app.schemas.like import PostLike, PostLikeCreate, PostLikeDelete

router = APIRouter()


@router.get("/feed", status_code=201, response_model=Blogs)
def get_feed(*, obj_in: PostCommentCreate, db: Session = Depends(deps.get_db),
             current_user: User = Depends(get_current_user)) -> Any:
    """
    Implement user specific feed
    """
    return CollectionResponse(result=[])


@router.get("/following")
def get_feed_by_followed(*, db: Session = Depends(deps.get_db),
                         current_user: User = Depends(get_current_user)) -> Any:
    """
    Get blogs from followed people
    """
    result=crud.blog.get_blogs_from_followed(db=db,user_id=current_user.id)
    return result

@router.get("/recent")
def get_recently_viewed(*, obj_in: PostCommentCreate, db: Session = Depends(deps.get_db),
                        current_user: User = Depends(get_current_user)) -> Any:
    """Implement get recently viewed blogs"""



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
def delete_blog(blog_id: int, db: Session = Depends(deps.get_db),
                current_user: User = Depends(get_current_user)) -> Any:
    """Implement delete blog"""
    result = crud.blog.remove(db=db, blog_id=blog_id, user_id=current_user.id)


@router.post("/{blog_id}/like", status_code=200, response_model=PostLike)
def post_like(*, blog_id: int, db: Session = Depends(deps.get_db),
              current_user: User = Depends(get_current_user)) -> Any:
    post_like_create = PostLikeCreate()
    post_like_create.blog_id = blog_id
    post_like_create.user_id = current_user.id
    result = crud.post_like.create(db=db, obj_in=post_like_create)
    return result


@router.delete("/{blog_id}/like", status_code=200, response_model=PostLike)
def post_unlike(*, blog_id: int, db: Session = Depends(deps.get_db),
                current_user: User = Depends(get_current_user)) -> Any:
    post_like_delete = PostLikeDelete()
    post_like_delete.blog_id = blog_id
    post_like_delete.user_id = current_user.id
    result = crud.post_like.remove(db=db, obj_in=post_like_delete)
    return result


@router.get("/{blog_id}/comment", status_code=200, response_model=PostComments)
def get_post_comments(blog_id: int, db: Session = Depends(deps.get_db),
                      current_user: User = Depends(get_current_user)):
    """
    Get comments for specific blog post
    """
    post_comments = crud.post_comment.get_comments(db, blog_id=blog_id)
    return PostComments(comments=post_comments)


@router.post("/{blog_id}/comment", status_code=200, response_model=PostComment)
def post_comment(*, obj_in: PostCommentCreate, db: Session = Depends(deps.get_db),
                 current_user: User = Depends(get_current_user)) -> Any:
    post_comment_create = PostCommentCreateUtil(**obj_in.dict())
    post_comment_create.commenter_id = current_user.id
    result = crud.post_comment.create(db=db, obj_in=post_comment_create)
    return result


@router.delete("/{blog_id}/comment/{comment_id}", status_code=200)
def delete_comment(*, comment_id: int, db: Session = Depends(deps.get_db),
                   current_user: User = Depends(get_current_user)):
    """Implement delete comment"""
    result = crud.post_comment.remove(db=db, id=comment_id)


@router.post("/{blog_id}/report", status_code=200, response_model=Blog)
def report_blog(*, obj_in: PostCommentCreate, db: Session = Depends(deps.get_db),
                current_user: User = Depends(get_current_user)) -> Any:
    """Implement report blog"""


@router.post("/", status_code=201, response_model=Blog)
def create_blog(
        *, blog_in: BlogCreate, db: Session = Depends(deps.get_db), current_user: User = Depends(get_current_user)
) -> dict:
    """
    Create a new recipe in the database.
    """
    print(current_user)
    blog_create_util = BlogCreateUtil(**blog_in.dict())
    blog_create_util.author_id = current_user.id
    blog = crud.blog.create(db=db, obj_in=blog_create_util)
    blog_id = blog.id
    for tag in blog_in.tags:
        crud.post_tag.create(db=db, title=tag, blog_id=blog_id)

    return blog
