from sqlalchemy import DateTime, Integer, String, Column, Boolean, ForeignKey
from sqlalchemy.orm import relationship
import datetime

from app.db.base_class import Base


class UserView(Base):
    id = Column(Integer, primary_key=True)
    blog_id = Column(Integer, ForeignKey('blog.id'), nullable=True)
    user_id = Column(Integer, ForeignKey('user.id'))
    created_at = Column(DateTime, default=datetime.datetime.utcnow())
    blog = relationship("Blog", foreign_keys=[blog_id])
    user = relationship("User", foreign_keys=[user_id])
