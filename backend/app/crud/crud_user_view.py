from sqlalchemy.orm import Session
from sqlalchemy.sql.elements import and_

from app.crud.base import CRUDBase
from app.models import UserView
from app.schemas.user_view import UserViewCreate


class CRUDUserView(CRUDBase[UserView, UserViewCreate,UserViewCreate]):

    def create(self, db: Session, *, obj_in: UserViewCreate):
        print(db.query(UserView).all())
        print(obj_in.blog_id)
        query=db.query(UserView).where(and_(obj_in.blog_id==UserView.blog_id,obj_in.user_id==UserView.user_id))
        print(query)

        blog_seen=len(query.all())==1

        print("Crud userview entry creating")
        print(blog_seen)
        print("Entry created")
        if(not blog_seen):
            db_obj=UserView(user_id=obj_in.user_id,blog_id=obj_in.blog_id)
            db.add(db_obj)
            db.commit()

    def get_recent_search(self,db:Session,*,user_id:int):
        result=db.query(UserView).filter(UserView.user_id==user_id).order_by(UserView.created_at.desc())
        return result.all()


user_view=CRUDUserView(UserView)