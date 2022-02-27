from sqlalchemy import Integer, String, Column, ForeignKey
from sqlalchemy.orm import relationship

from app.db.base_class import Base


class Collection(Base):
    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey('user.id'), nullable=False)
    author = relationship("User", foreign_keys=[user_id])
