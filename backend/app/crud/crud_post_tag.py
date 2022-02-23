from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.crud.crud_tag import tag
from app.models import UserFollower, Tag, PostTag
from app.schemas.tag import PostTagCreate, PostTagDelete, TagCreate


class CRUDPostTag(CRUDBase[PostTag, PostTagCreate, PostTagDelete]):
    def create(self, db: Session, *, title: str, blog_id: int) -> PostTag:
        tag_res = tag.create(db=db, obj_in=TagCreate(title=title))
        obj = PostTagCreate(tag_id=tag_res.id, blog_id=blog_id)
        db_obj = PostTag(**obj.dict())
        db.add(db_obj)
        db.commit()
        return db_obj

    def get(self, db: Session, *, title: str) -> bool:
        result = db.query(PostTag).join(Tag).filter(Tag.title == title).first()


post_tag = CRUDPostTag(PostTag)
