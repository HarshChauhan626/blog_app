from sqlalchemy import Integer, String, Column, ForeignKey
from sqlalchemy.orm import relationship

from app.db.base_class import Base


class Like(Base):
    id = Column(Integer, primary_key=True, index=True)
    blog_id = Column(Integer, ForeignKey('blog.id'), nullable=False)
    user_id = Column(Integer, ForeignKey('user.id'), nullable=False)
    author = relationship("User",foreign_keys=[user_id])
    blog=relationship("Blog",foreign_keys=[blog_id])
