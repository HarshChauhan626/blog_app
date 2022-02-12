from datetime import datetime
from typing import Optional
from xml.dom.domreg import registered

from pydantic import BaseModel, EmailStr


class UserBase(BaseModel):
    username: str
    first_name: Optional[str]
    middle_name: Optional[str]
    last_name: Optional[str]
    email: Optional[EmailStr] = None
    mobile: Optional[str] = None
    intro: Optional[str] = None
    is_superuser: bool = False


# Properties to receive via API on creation
class UserCreate(UserBase):
    email: EmailStr
    password: str


# Properties to receive via API on update
class UserUpdate(UserBase):
    ...


class UserInDBBase(UserBase):
    id: Optional[int] = None
    registered_at: Optional[datetime]
    last_login: Optional[datetime]

    class Config:
        orm_mode = True


# Additional properties stored in DB but not returned by API
class UserInDB(UserInDBBase):
    hashed_password: str


# Additional properties to return via API
class User(UserInDBBase):
    ...
