from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.models import UserFollower
from app.models.post_category import PostCategory
from app.schemas.category import PostCategoryCreate, PostCategoryBase
from app.schemas.user_follower import UserFollowerCreate, UserFollowerDelete


class CRUDPostCategory(CRUDBase[PostCategory, PostCategoryCreate, PostCategoryBase]):
    def create(self, db: Session, *, obj_in: PostCategoryCreate) -> PostCategory:
        create_obj = obj_in.dict()
        db_obj = PostCategory(**create_obj)
        db.add(db_obj)
        db.commit()
        return db_obj


post_category = CRUDPostCategory(PostCategory)
