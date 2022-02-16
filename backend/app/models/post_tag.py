from sqlalchemy import Integer, String, Column, ForeignKey
from sqlalchemy.orm import relationship

from app.db.base_class import Base

#Use foreign key with single quotes
# https://stackoverflow.com/questions/22355890/sqlalchemy-multiple-foreign-keys-in-one-mapped-class-to-the-same-primary-key

class PostTag(Base):
    id = Column(Integer, primary_key=True, index=True)
    blog_id = Column(Integer, ForeignKey('blog.id'), nullable=False)
    tag_id = Column(Integer, ForeignKey('tag.id'), nullable=False)
    tag_rel= relationship("Tag",foreign_keys=[tag_id])
    post=relationship("Blog",foreign_keys=[blog_id])
