from datetime import datetime
from typing import Optional
from xml.dom.domreg import registered

from pydantic import BaseModel, EmailStr


class UserFollowerBase(BaseModel):
    source_id: int
    target_id: int


class UserFollowerCreate(UserFollowerBase):
    ...


class UserFollowerDelete(UserFollowerBase):
    ...


class UserFollowerInDBBase(UserFollowerBase):
    id: Optional[int] = None
    created_at: Optional[datetime]
    updated_at: Optional[datetime]

    class Config:
        orm_mode = True


class UserFollower(UserFollowerInDBBase):
    ...
