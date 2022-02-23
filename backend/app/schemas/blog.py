from datetime import datetime
from typing import Optional, Sequence, List

from pydantic import BaseModel


class BlogBase(BaseModel):
    title: str
    content: str
    meta_title: str
    summary: str
    published: int
    author_id: int


class BlogCreate(BlogBase):
    tags: List[str]


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


# Properties to return to client
class Blog(BlogInDBBase):
    pass


# Properties stored in DB
class BlogInDB(BlogInDBBase):
    pass


class BlogSearchResults(BaseModel):
    results: Sequence[Blog]
