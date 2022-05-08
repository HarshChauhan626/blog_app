from typing import Type

from pydantic.class_validators import Any
from sqlalchemy.orm import Session

from app import crud
from app.crud.base import CRUDBase
from app.models import User
from app.models.blog import Blog
from app.schemas.blog import BlogCreate, BlogUpdate, BlogResponse, AuthorDetails, Blogs


class CRUDBlog(CRUDBase[Blog, BlogCreate, BlogUpdate]):
    def create(self, db: Session, *, obj_in: BlogCreate) -> Blog:
        create_obj = obj_in.dict()
        create_obj.pop("tags")
        db_obj = Blog(**create_obj)
        db.add(db_obj)
        db.commit()
        return db_obj



    def remove(self, db: Session, *, blog_id: int, user_id: int):
        db_obj = db.query(Blog).where(Blog.id == blog_id and Blog.author_id == user_id)
        db.delete(db_obj)

    def get_blogs_from_followed(self, db: Session, *, user_id: int):
        lis = [x for x in crud.user_follower.get_followed(db=db, user_id=user_id)]
        # post_tags=[x for x in crud.post_tag.]
        blog_list = []
        for i in range(len(lis)):
            result = db.query(Blog).filter(Blog.author_id == lis[i].target_id)
            author_info = db.query(User).filter(User.id == lis[i].target_id).first()
            if len(result.all()) != 0:
                for j in range(len(result.all())):
                    tag_list = crud.post_tag.get_post_tag(db, blog_id=result[j].id)
                    print(result[j])
                    blog = BlogResponse.from_orm_obj(blog=result[j], tag_list=tag_list,
                                                     author_details=AuthorDetails(id=author_info.id,
                                                                                  name="{} {}".format(
                                                                                      author_info.first_name,
                                                                                      author_info.last_name)))
                    print("Print")
                    print(result[j])
                    blog_list.append(blog)
            else:
                print("No blogs from this author")
        return Blogs(results=blog_list)

    def get_feed(self, db: Session, *, user_id: int):
        pass

    def get_recent_search(self, db: Session, user_id: int):
        recent_search_result=crud.user_view.get_recent_search(db=db,user_id=user_id)
        blog_list=[]
        for i in range(len(recent_search_result)):
            blog= self.get_blog(db=db, blog_id=recent_search_result[i].blog_id)
            blog_list.append(blog)
        return blog_list



    def get_blog(self, db: Session, blog_id: int):
        blog_result = db.query(Blog).filter(Blog.id == blog_id).first()
        author_info = db.query(User).filter(blog_result.author_id == User.id).first()
        tag_list = crud.post_tag.get_post_tag(db, blog_id=blog_result.id)
        blog = BlogResponse.from_orm_obj(blog=blog_result, tag_list=tag_list,
                                         author_details=AuthorDetails(id=author_info.id,
                                                                      name="{} {}".format(author_info.first_name,
                                                                                          author_info.last_name)))
        return blog


blog = CRUDBlog(Blog)
