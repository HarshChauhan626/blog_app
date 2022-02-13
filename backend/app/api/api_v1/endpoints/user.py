import asyncio
from typing import Any, Optional

from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session

from app import crud
from app.api import deps
from app.api.deps import get_current_user
from app.schemas.user_follower import UserFollowerCreate, UserFollower, UserFollowerDelete

router = APIRouter()


@router.post("/follow", status_code=200, response_model=UserFollower)
async def follow_other(
        *,
        user_follower: UserFollowerCreate,
        db: Session = Depends(deps.get_db)
) -> Any:
    """
    Follow other bloggers
    """
    print(user_follower)
    result = crud.user_follower.create(db=db, obj_in=user_follower)

    return result
