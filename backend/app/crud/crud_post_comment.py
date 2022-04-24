from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.models import Comment
from app.schemas.comment import PostCommentCreate, PostComment


class CRUDPostComment(CRUDBase[Comment, PostCommentCreate, PostComment]):
    def create(self, db: Session, *, obj_in: PostCommentCreate) -> Comment:
        create_obj = obj_in.dict()
        db_obj = Comment(**create_obj)
        db.add(db_obj)
        db.commit()
        return db_obj


post_comment = CRUDPostComment(Comment)
