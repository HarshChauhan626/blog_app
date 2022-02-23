from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.models import Like
from app.schemas.like import PostLike, PostLikeDelete, PostLikeCreate


class CRUDPostLike(CRUDBase[Like, PostLikeCreate, PostLikeDelete]):
    def create(self, db: Session, *, obj_in: PostLikeCreate) -> PostLike:
        create_obj = obj_in.dict()
        db_obj = PostLike(**create_obj)
        db.add(db_obj)
        db.commit()
        return db_obj

    def remove(self, db: Session, *, obj_in: PostLikeDelete) -> PostLike:
        db_obj = db.query(PostLike).filter(PostLike.blog_id == obj_in.blog_id and PostLike.user_id == obj_in.user_id).first()
        db.delete(db_obj)
        db.commit()
        return db_obj


post_like = CRUDPostLike(PostLike)
