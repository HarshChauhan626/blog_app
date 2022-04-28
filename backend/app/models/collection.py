from sqlalchemy import Integer, String, Column, ForeignKey
from sqlalchemy.orm import relationship

from app.db.base_class import Base


class Collection(Base):
    id = Column(Integer, primary_key=True, index=True)
    collection_name = Column(String(256), nullable=False)
    author_id = Column(Integer, ForeignKey('user.id',ondelete="Cascade"),nullable=False)
    author = relationship("User", foreign_keys=[author_id])
