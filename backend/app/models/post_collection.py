import datetime
from sqlalchemy import Boolean, Column, DateTime, Integer, String, ForeignKey
from sqlalchemy.orm import relationship

from app.db.base_class import Base


class PostCollection(Base):
    id = Column(Integer, primary_key=True, index=True)
    collection_id = Column(Integer, ForeignKey('collection.id'), nullable=False, )
    blog_id = Column(Integer, ForeignKey('blog.id'), nullable=False)
    user_id = Column(Integer, ForeignKey('user.id'), nullable=False)
    collection = relationship("Collection", foreign_keys=[collection_id])
    blog = relationship("Blog", foreign_keys=[blog_id])
    user = relationship("User", foreign_keys=[user_id])
