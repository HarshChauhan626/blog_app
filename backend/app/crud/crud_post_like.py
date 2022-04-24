from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.models import Like
from app.schemas.like import PostLike, PostLikeDelete, PostLikeCreate


class CRUDPostLike(CRUDBase[Like, PostLikeCreate, PostLikeDelete]):
    def create(self, db: Session, *, obj_in: PostLikeCreate) -> Like:
        create_obj = obj_in.dict()
        db_obj = Like(**create_obj)
        db.add(db_obj)
        db.commit()
        return db_obj

    def remove(self, db: Session, *, obj_in: PostLikeDelete) -> Like:
        db_obj = db.query(Like).filter(Like.blog_id == obj_in.blog_id and Like.user_id == obj_in.user_id).first()
        db.delete(db_obj)
        db.commit()
        return db_obj


post_like = CRUDPostLike(Like)
