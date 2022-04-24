from pydantic import BaseModel


class CollectionBase(BaseModel):
    title: str


class CollectionCreate(CollectionBase):
    ...


class CollectionUpdate(BaseModel):
    title: str
    collection_id: str


class CollectionDelete:
    collection_id: int


class CollectionInDBBase(CollectionBase):
    id: int

    class Config:
        orm_mode = True


class Collection(CollectionInDBBase):
    ...
