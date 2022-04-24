import datetime

from sqlalchemy import Integer, String, Column, ForeignKey, DateTime
from sqlalchemy.orm import relationship

from app.db.base_class import Base


class Comment(Base):
    id = Column(Integer, primary_key=True, index=True)
    blog_id = Column(Integer, ForeignKey('blog.id'), nullable=False)
    commenter_id = Column(Integer, ForeignKey('user.id'), nullable=False)
    reply_to = Column(Integer, ForeignKey('user.id'), nullable=True)
    comment = Column(String, nullable=False)
    created_at = Column(DateTime, default=datetime.datetime.utcnow, nullable=False)
    author = relationship("User", foreign_keys=[commenter_id])
    reply_to_rel = relationship("User", foreign_keys=[reply_to])
    blog = relationship("Blog", foreign_keys=[blog_id])