from datetime import datetime
from typing import Optional, Sequence

from pydantic import BaseModel


class PostCommentBase(BaseModel):
    comment: str
    blog_id: int
    reply_to: Optional[int] = None


class PostCommentCreate(PostCommentBase):
    ...


class PostCommentCreateUtil(PostCommentCreate):
    commenter_id: Optional[int]


class PostCommentInDBBase(PostCommentBase):
    id: int
    commenter_id: int
    created_at: datetime

    class Config:
        orm_mode = True


class PostComment(PostCommentInDBBase):
    ...

class PostComments(BaseModel):
    comments:Sequence[PostComment]