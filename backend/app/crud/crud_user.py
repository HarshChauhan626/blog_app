from typing import Any, Dict, Optional, Union

from sqlalchemy.orm import Session
from sqlalchemy.sql.elements import or_

from app.crud.base import CRUDBase
from app.models.user import User
from app.schemas.user import UserCreate, UserUpdate, Users
from app.core.security import get_password_hash


class CRUDUser(CRUDBase[User, UserCreate, UserUpdate]):
    def get_by_email(self, db: Session, *, email: str) -> Optional[User]:
        return db.query(User).filter(User.email == email).first()

    def create(self, db: Session, *, obj_in: UserCreate) -> User:
        create_data = obj_in.dict()
        create_data.pop("password")
        db_obj = User(**create_data)
        db_obj.hashed_password = get_password_hash(obj_in.password)
        db.add(db_obj)
        db.commit()

        return db_obj

    def update(
        self, db: Session, *, db_obj: User, obj_in: Union[UserUpdate, Dict[str, Any]]
    ) -> User:
        if isinstance(obj_in, dict):
            update_data = obj_in
        else:
            update_data = obj_in.dict(exclude_unset=True)

        return super().update(db, db_obj=db_obj, obj_in=update_data)

    def is_superuser(self, user: User) -> bool:
        return user.is_superuser

    def search_user(self,db:Session,keyword:str)->Users:
        user_list=[]
        first_name_query=db.query(User).filter(User.first_name.contains(keyword)).all()
        middle_name_query=db.query(User).filter(User.middle_name.contains(keyword)).all()
        last_name_query=db.query(User).filter(User.last_name.contains(keyword)).all()
        user_name_query=db.query(User).filter(User.username.contains(keyword)).all()
        for i in range(len(first_name_query)):
            user_list.append(first_name_query[i])
        for j in range(len(middle_name_query)):
            user_list.append(middle_name_query[j])
        for k in range(len(last_name_query)):
            user_list.append(last_name_query[k])
        for l in range(len(user_name_query)):
            user_list.append(user_name_query[l])
        # print(user_list[0].first_name)
        return Users(results=user_list)

user = CRUDUser(User)
