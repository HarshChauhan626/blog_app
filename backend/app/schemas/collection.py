from typing import List

from pydantic import BaseModel


class CollectionBase(BaseModel):
    collection_name: str


class CollectionCreate(CollectionBase):
    ...


class CollectionCreateUtil(BaseModel):
    collection_name: str
    author_id: int


class CollectionUpdate(BaseModel):
    collection_name: str
    collection_id: str


class CollectionDelete:
    collection_id: int


class CollectionInDBBase(CollectionBase):
    id: int
    author_id: int


    class Config:
        orm_mode = True


class Collection(CollectionInDBBase):
    ...


class CollectionList(BaseModel):
    collection_list:List[Collection]
