from sqlalchemy.orm import Session
from sqlalchemy.sql.elements import and_

from app.crud.base import CRUDBase
from app.models import UserFollower
from app.schemas.user_follower import UserFollowerCreate, UserFollowerDelete


class CRUDUserFollower(CRUDBase[UserFollower, UserFollowerCreate, UserFollowerDelete]):
    def create(self, db: Session, *, obj_in: UserFollowerCreate) -> UserFollower:
        create_obj = obj_in.dict()
        db_obj = UserFollower(**create_obj)
        if not self.already_followed(db=db, user_id=db_obj.source_id, target_id=db_obj.target_id):
            db.add(db_obj)
            db.commit()
        return db_obj

    def remove(self, db: Session, *, obj_in: UserFollowerDelete) -> UserFollower:
        db_obj = db.query(UserFollower).filter(
            and_(UserFollower.target_id == obj_in.target_id, UserFollower.source_id == obj_in.source_id))
        db.delete(db_obj)
        db.commit()
        return db_obj

    def get_followed(self, db: Session, *, user_id: int) -> UserFollower:
        result = db.query(UserFollower).filter(UserFollower.source_id == user_id)
        return result.all()

    def already_followed(self, db: Session, user_id: int, target_id: int) -> bool:
        result = db.query(UserFollower).filter(
            and_(UserFollower.target_id == target_id, UserFollower.source_id == user_id))
        length = len(result.all())
        result_all = result.all()
        print(result_all)
        if len(result.all()) > 0:
            return True
        else:
            return False


user_follower = CRUDUserFollower(UserFollower)
