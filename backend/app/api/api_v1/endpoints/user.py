from typing import Any

from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from app import crud
from app.api import deps
from app.api.deps import get_current_user
from app.models import User
from app.schemas.collection import CollectionCreate, Collection, CollectionCreateUtil, CollectionList
from app.schemas.user_follower import UserFollowerCreate, UserFollower, UserFollowerDelete

router = APIRouter()


@router.post("/follow", status_code=200, response_model=UserFollower, )
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


@router.post("/collection/{collection_name}", status_code=200, response_model=Collection)
async def create_collection(collection_name: str, db: Session = Depends(deps.get_db),
                            current_user: User = Depends(get_current_user)) -> Any:
    """
    Create collection.
    """
    collection_create_obj = CollectionCreateUtil(collection_name=collection_name, author_id=current_user.id)
    result = crud.collection.create(db=db, obj_in=collection_create_obj)
    return result


@router.get("/collection", status_code=200, response_model=CollectionList)
async def fetch_user_collection(db: Session = Depends(deps.get_db),
                                current_user: User = Depends(get_current_user)) -> Any:
    result = crud.collection.get_user_collections(db=db, user_id=current_user.id)
    return CollectionList(collection_list=result)


@router.delete("/collection/{collection_id}", status_code=200, response_model=Collection)
async def delete_collection(collection_id: int, db: Session = Depends(deps.get_db),
                            current_user: User = Depends(get_current_user)) -> Any:
    result = crud.crud_collection.collection.get(db=db, id=current_user.id)
    return result


@router.patch("/collection/{collection_id}", status_code=200, response_model=Collection)
async def update_collection_name(collection_id: int, db: Session = Depends(deps.get_db),
                                 current_user: User = Depends(get_current_user)) -> Any:
    result = crud.crud_collection.collection.get(db=db, id=current_user.id)
    return result


@router.get("/collection/{collection_id}", status_code=200, response_model=Collection)
async def fetch_collection(collection_id: int, db: Session = Depends(deps.get_db),
                           current_user: User = Depends(get_current_user)) -> Any:
    result = crud.collection.get_collection(db=db, collection_id=collection_id)
    return result


@router.post("/collection/{collection_id}/{blog_id}", status_code=200)
def add_blog_to_collection(*, blog_id: int, collection_id: int, db: Session = Depends(deps.get_db),
                           current_user: User = Depends(get_current_user)):
    """Implement add blog to collection"""
    result = crud.post_collection.add_post(db=db, blog_id=blog_id, collection_id=collection_id, user_id=current_user.id)


@router.delete("/collection/{collection_id}/{blog_id}", status_code=200)
def add_blog_to_collection(*, blog_id: int, collection_id: int, db: Session = Depends(deps.get_db),
                           current_user: User = Depends(get_current_user)):
    """Implement add blog to collection"""
    result = crud.post_collection.remove_post(db=db, blog_id=blog_id, collection_id=collection_id)


@router.post("/", status_code=200, response_model=Collection)
async def update_user_info(*, db: Session = Depends(deps.get_db),
                           current_user: User = Depends(get_current_user)) -> Any:
    result = crud.crud_collection.collection.get(db=db, id=current_user.id)
    return result


@router.delete("/", status_code=200)
async def delete_user(*, db: Session = Depends(deps.get_db),
                      current_user: User = Depends(get_current_user)) -> Any:
    result = crud.user.remove(db=db, id=current_user.id)
    return result
