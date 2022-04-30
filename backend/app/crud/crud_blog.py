from pydantic.class_validators import Any
from sqlalchemy.orm import Session

from app import crud
from app.crud.base import CRUDBase
from app.models.blog import Blog
from app.schemas.blog import BlogCreate, BlogUpdate


class CRUDBlog(CRUDBase[Blog, BlogCreate, BlogUpdate]):
    def create(self, db: Session, *, obj_in: BlogCreate) -> Blog:
        create_obj = obj_in.dict()
        create_obj.pop("tags")
        db_obj = Blog(**create_obj)
        db.add(db_obj)
        db.commit()
        return db_obj

    def remove(self, db: Session, *, blog_id: int, user_id: int):
        db_obj = db.query(Blog).where(Blog.id == blog_id and Blog.author_id == user_id)
        db.delete(db_obj)

    def get_blogs_from_followed(self,db:Session,*,blog_id:int,user_id:int):
        lis=[x for x in crud.user_follower.get_followed()]
        blog_list=[]
        for i in range(lis.length):
            result = db.query(Blog).filter(Blog.author_id == id)
            if(result.length != 0):
                blog_list+=result
            else:
                print("No blogs from this author")
        return blog_list

    def get_feed(self,db:Session,*,user_id:int):
        pass

    def get_recent_search(self,db:Session,user_id:int):
        pass

blog = CRUDBlog(Blog)
