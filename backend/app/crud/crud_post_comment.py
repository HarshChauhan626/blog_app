from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.models import Comment
from app.schemas.comment import PostCommentCreate, PostComment
from typing import List


class CRUDPostComment(CRUDBase[Comment, PostCommentCreate, PostComment]):
    def create(self, db: Session, *, obj_in: PostCommentCreate) -> Comment:
        create_obj = obj_in.dict()
        db_obj = Comment(**create_obj)
        db.add(db_obj)
        db.commit()
        return db_obj

    def get_comments(self, db: Session, *, blog_id: int) -> List[Comment]:
        result = db.query(Comment).filter(Comment.blog_id == blog_id)
        print(result.all())
        return result.all()


post_comment = CRUDPostComment(Comment)
