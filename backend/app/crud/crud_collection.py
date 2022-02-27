from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.models.collection import Collection
from app.schemas.collection import CollectionCreate, CollectionDelete
from typing import List


class CRUDCollection(CRUDBase[Collection, CollectionCreate, CollectionDelete]):
    def create(self, db: Session, *, obj_in: CollectionCreate) -> Collection:
        create_obj = obj_in.dict()
        db_obj = Collection(**create_obj)
        db.add(db_obj)
        db.commit()
        return db_obj

    def get(self,db:Session,*,user_id:int)->List[Collection]:
        result=db.query(Collection).where(Collection.user_id==user_id)
        return result


collection = CRUDCollection(Collection)
