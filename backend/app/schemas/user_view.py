from pydantic import BaseModel

class UserViewCreate(BaseModel):
    blog_id:int
    user_id:int



