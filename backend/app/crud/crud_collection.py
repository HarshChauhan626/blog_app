from sqlalchemy import select
from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.models import Blog, PostCollection
from app.models.collection import Collection
from app.schemas.collection import CollectionCreate, CollectionDelete
from typing import List, Any


class CRUDCollection(CRUDBase[Collection, CollectionCreate, CollectionDelete]):
    def create(self, db: Session, *, obj_in: CollectionCreate) -> Collection:
        create_obj = obj_in.dict()
        db_obj = Collection(**create_obj)
        db.add(db_obj)
        db.commit()
        return db_obj

    def get_user_collections(self, db: Session, *, user_id: int) -> List[Collection]:
        result = db.query(Collection).where(Collection.author_id == user_id)
        return result.all()


    def get_collection(self, db: Session, *,collection_id:int,user_id:int) -> Any:
        join_query = db.query(Blog).join(PostCollection).filter(PostCollection.blog_id==Blog.id)
        print(join_query)
        return join_query.all()


collection = CRUDCollection(Collection)
