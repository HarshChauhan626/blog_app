from sqlalchemy import Integer, String, Column, ForeignKey
from sqlalchemy.orm import relationship

from app.db.base_class import Base


class PostCategory(Base):
    id = Column(Integer, primary_key=True, index=True)
    category_id = Column(Integer, nullable=False)
    blog_id = Column(Integer, ForeignKey('blog.id'), nullable=False)
    post = relationship("Blog", foreign_keys=[blog_id])
