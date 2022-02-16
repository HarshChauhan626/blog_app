from typing import Optional

from pydantic import BaseModel


class CategoryBase(BaseModel):
    title: str


class CategoryInDB(BaseModel):
    id: Optional[int] = None

    class Config:
        orm_mode = True


class Category(CategoryInDB):
    ...


class PostCategoryBase(BaseModel):
    category_id: int
    blog_id: int


class PostCategoryInDBBase(PostCategoryBase):
    id: int

    class Config:
        orm_mode = True