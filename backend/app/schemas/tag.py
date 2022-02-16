from typing import Optional

from pydantic import BaseModel


class TagBase(BaseModel):
    title: str


class TagCreate(TagBase):
    ...


class TagInDBBase(TagBase):
    id: Optional[int] = None

    class Config:
        orm_mode = True


class Tag(TagInDBBase):
    ...


class PostTagBase(BaseModel):
    tag_id: int
    blog_id: int


class PostTagInDBBase(PostTagBase):
    id: Optional[int] = None

    class Config:
        orm_mode = True


class PostTag(PostTagBase):
    ...



