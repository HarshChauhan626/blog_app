from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.models import Tag
from app.schemas.tag import TagCreate, TagBase


class CRUDTag(CRUDBase[Tag, TagCreate, TagBase]):
    def create(self, db: Session, *, obj_in: TagCreate) -> Tag:
        if(self.get(db=db,tag=obj_in.title)):
            print("Self get running")
            return self.get(db=db,tag=obj_in.title)
        else:
            create_obj = obj_in.dict()
            db_obj = Tag(**create_obj)
            db.add(db_obj)
            db.commit()
            print("Returning db_obj")
            return db_obj

    def get(self, db: Session, *, tag: str) -> Tag:
        obj = db.query(Tag).where(Tag.title == tag).first()
        return obj


tag = CRUDTag(Tag)
