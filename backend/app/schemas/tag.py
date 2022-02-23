from typing import Optional

from pydantic import BaseModel


class TagBase(BaseModel):
    title: str


class TagCreate(TagBase):
    ...


class TagInDBBase(TagBase):
    id: int

    class Config:
        orm_mode = True


class Tag(TagInDBBase):
    ...


class PostTagBase(BaseModel):
    tag_id: int
    blog_id: int

class PostTagCreate(PostTagBase):
    ...


class PostTagDelete(PostTagBase):
    ...




class PostTagInDBBase(PostTagBase):
    id: int

    class Config:
        orm_mode = True


class PostTag(PostTagInDBBase):
    ...



