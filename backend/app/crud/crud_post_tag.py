from typing import Any

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

    def get_post_tag(self,db:Session,blog_id:int)->Any:
        result=db.query(PostTag.tag_id,Tag.title).filter(PostTag.blog_id==blog_id).join(Tag).filter(Tag.id==PostTag.tag_id)
        print(result.all())
        tag_list=[]
        if(len(result.all())!=0):
            for i in range(len(result.all())):
                tag_list.append(result[i].title)
        return tag_list

post_tag = CRUDPostTag(PostTag)
