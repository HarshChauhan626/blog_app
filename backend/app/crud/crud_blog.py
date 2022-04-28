from pydantic.class_validators import Any
from sqlalchemy.orm import Session

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



blog = CRUDBlog(Blog)
