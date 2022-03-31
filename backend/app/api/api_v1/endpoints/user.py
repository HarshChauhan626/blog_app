from typing import Any

from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from app import crud
from app.api import deps
from app.api.deps import get_current_user
from app.models import User
from app.schemas.collection import CollectionCreate, Collection
from app.schemas.user_follower import UserFollowerCreate, UserFollower, UserFollowerDelete

router = APIRouter()


@router.post("/follow", status_code=200, response_model=UserFollower)
async def follow_other(
        *,
        target_id: int,
        db: Session = Depends(deps.get_db),
        current_user: User = Depends(get_current_user)
) -> Any:
    """
    Follow other blogger
    """
    user_follower = UserFollowerCreate()
    user_follower.source_id = current_user.id
    user_follower.target_id = target_id
    result = crud.user_follower.create(db=db, obj_in=user_follower)

    return result


@router.post("/unfollow", status_code=200, response_model=UserFollower)
async def unfollow_other(*, target_id: int, db: Session = Depends(deps.get_db),
                         current_user: User = Depends(get_current_user)) -> Any:
    """
    Unfollow other blogger.
    """
    user_delete = UserFollowerDelete()
    user_delete.source_id = current_user.id
    user_delete.target_id = target_id
    result = crud.user_follower.remove(db=db, obj_in=user_delete)
    return result


@router.post("/collection", status_code=200, response_model=Collection)
async def create_collection(*, db: Session = Depends(deps.get_db), obj_in: CollectionCreate) -> Any:
    """
    Create collection.
    """
    result = crud.crud_collection.collection.create(db=db, obj_in=obj_in)
    return result


@router.get("/collection", status_code=200, response_model=Collection)
async def fetch_collections(*, db: Session = Depends(deps.get_db),
                            current_user: User = Depends(get_current_user)) -> Any:
    result = crud.crud_collection.collection.get(db=db, id=current_user.id)
    return result
