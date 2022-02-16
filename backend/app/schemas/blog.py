from datetime import datetime
from typing import Optional, Sequence

from pydantic import BaseModel


class BlogBase(BaseModel):
    title: str
    content: str
    slug: str
    summary: str
    published: int


class BlogCreate(BlogBase):
    ...


class BlogUpdate(BlogBase):
    content: Optional[str]
    summary: Optional[str]
    published: Optional[int]


# Properties shared by models stored in DB
class BlogInDBBase(BlogBase):
    id: int
    author_id: int
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
