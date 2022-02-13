from sqlalchemy import DateTime, Integer, String, Column, Boolean
from sqlalchemy.orm import relationship
import datetime

from app.db.base_class import Base


class UserFollower(Base):
    id = Column(Integer, primary_key=True, index=True)
    source_id=Column(Integer,nullable=False)
    target_id=Column(Integer,nullable=False)
    created_at=Column(DateTime,default=datetime.datetime.utcnow,nullable=False)
    update_at=Column(DateTime,default=datetime.datetime.utcnow,nullable=False)