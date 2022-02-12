import datetime
from sqlalchemy import DATETIME, Boolean, Column, DateTime, Integer, String, ForeignKey
from sqlalchemy.orm import relationship

from app.db.base_class import Base


class Blog(Base):
    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(75), nullable=False)
    meta_title = Column(String(256), nullable=True)
    summary = Column(String,nullable=True)
    published=Column(Boolean,nullable=True)
    content = Column(String,nullable=False)
    source = Column(String(256), nullable=True)
    updated_at=Column(DateTime,default=datetime.datetime.utcnow,nullable=False)
    created_at=Column(DateTime,default=datetime.datetime.utcnow,nullable=False)
    author_id = Column(Integer, ForeignKey("user.id"), nullable=True)
    author = relationship("User", back_populates="blogs")
