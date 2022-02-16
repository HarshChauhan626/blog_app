from datetime import datetime
from typing import Optional, Sequence

from pydantic import BaseModel


class PostCommentBase(BaseModel):
    comment: str
    blog_id: int
    reply_to: Optional[int] = None


class PostCommentCreate(PostCommentBase):
    ...


class PostCommentInDBBase(PostCommentBase):
    id: int
    commenter_id: int
    create_time: datetime

    class Config:
        orm_mode = True


class PostComment(PostCommentInDBBase):
    ...
