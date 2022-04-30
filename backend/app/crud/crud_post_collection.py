from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.models import Comment, PostCollection
from app.schemas.comment import PostCommentCreate, PostComment
from typing import List


class CRUDPostCollection(CRUDBase[PostCollection, PostCollection, PostCollection]):
    # def create(self, db: Session, *, obj_in: PostCommentCreate) -> Comment:
    #     create_obj = obj_in.dict()
    #     db_obj = Comment(**create_obj)
    #     db.add(db_obj)
    #     db.commit()
    #     return db_obj

    def add_post(self,db:Session,*,blog_id:int,collection_id:int,user_id:int):
        db.add(PostCollection(blog_id=blog_id,collection_id=collection_id,user_id=user_id))


    def remove_post(self, db: Session, *, blog_id: int):
        result = db.query(Comment).filter(Comment.blog_id == blog_id)
        print(result.all())
        return result.all()


post_comment = CRUDPostCollection(PostCollection)
