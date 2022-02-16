from sqlalchemy import DateTime, Integer, String, Column, Boolean, ForeignKey
from sqlalchemy.orm import relationship
import datetime

from app.db.base_class import Base


class UserFollower(Base):
    id = Column(Integer, primary_key=True, index=True)
    source_id = Column(Integer, ForeignKey("user.id"), nullable=False)
    target_id = Column(Integer, ForeignKey("user.id"), nullable=False)
    created_at = Column(DateTime, default=datetime.datetime.utcnow, nullable=False)
    updated_at = Column(DateTime, default=datetime.datetime.utcnow, nullable=False)
    source = relationship("User", foreign_keys=[source_id])
    target = relationship("User", foreign_keys=[target_id])
