from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.models import UserFollower
from app.schemas.user_follower import UserFollowerCreate, UserFollowerDelete


class CRUDUserFollower(CRUDBase[UserFollower, UserFollowerCreate, UserFollowerDelete]):
    def create(self, db: Session, *, obj_in: UserFollowerCreate) -> UserFollower:
        create_obj = obj_in.dict()
        db_obj = UserFollower(**create_obj)
        db.add(db_obj)
        db.commit()
        return db_obj

    def remove(self, db: Session, *, obj_in: UserFollowerDelete) -> UserFollower:
        db_obj = db.query(UserFollower).filter(
            UserFollower.target_id == obj_in.target_id and UserFollower.source_id == obj_in.source_id)
        db.delete(db_obj)
        db.commit()
        return db_obj

    def get_followed(self,db:Session,*,user_id:int)->UserFollower:
        result=db.query(UserFollower).filter(UserFollower.source_id==user_id)
        return result.all()


user_follower = CRUDUserFollower(UserFollower)
