from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.models import UserFollower
from app.schemas.user_follower import UserFollowerCreate,UserFollowerDelete


class CRUDUserFollower(CRUDBase[UserFollower, UserFollowerCreate, UserFollowerDelete]):
    def create(self, db: Session, *, obj_in: UserFollowerCreate) -> UserFollower:
        create_obj=obj_in.dict()
        db_obj=UserFollower(**create_obj)
        db.add(db_obj)
        db.commit()
        return db_obj

    def remove(self, db: Session, *, obj_in: UserFollowerDelete) -> UserFollower:
        delete_obj=obj_in.dict()
        db_obj=UserFollower(**delete_obj)
        db.delete(db_obj)
        db.commit()
        return db_obj


user_follower= CRUDUserFollower(UserFollower)