from datetime import datetime
from typing import Optional, Sequence, List

from pydantic import BaseModel


class BlogBase(BaseModel):
    title: str
    content: str
    meta_title: str
    summary: str
    published: int


class BlogCreate(BlogBase):
    tags: List[str]


class BlogCreateUtil(BlogCreate):
    author_id: Optional[int]


class BlogUpdate(BlogBase):
    content: Optional[str]
    summary: Optional[str]
    published: Optional[int]


# Properties shared by models stored in DB
class BlogInDBBase(BlogBase):
    id: int
    created_at: datetime
    updated_at: datetime

    class Config:
        orm_mode = True


class AuthorDetails(BaseModel):
    id:int
    name:str


# Properties to return to client
class BlogResponse(BlogInDBBase):
    tag: Optional[List[str]]
    author_details:AuthorDetails

    @staticmethod
    def from_orm_obj(blog,tag_list,author_details):
        return BlogResponse(
            id=blog.id,
            tag=tag_list,
            title=blog.title,
            created_at=blog.created_at,
            meta_title=blog.meta_title,
            content=blog.content,
            published=blog.published,
            summary=blog.summary,
            updated_at=blog.updated_at,
            author_details=author_details
        )


# Properties stored in DB
class BlogInDB(BlogInDBBase):
    pass

class BlogListItemResponse(BaseModel):
    id:int
    title: str
    meta_title: str
    published: int
    tag: Optional[List[str]]
    author_details: AuthorDetails
    created_at:datetime
    updated_at:datetime

    @staticmethod
    def from_orm_obj(blog, tag_list, author_details):
        return BlogListItemResponse(
            id=blog.id,
            tag=tag_list,
            title=blog.title,
            created_at=blog.created_at,
            meta_title=blog.meta_title,
            published=blog.published,
            updated_at=blog.updated_at,
            author_details=author_details,
        )



class Blogs(BaseModel):
    results: Sequence[BlogListItemResponse]
