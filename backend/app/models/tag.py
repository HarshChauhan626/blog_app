from sqlalchemy import Integer, String, Column
from sqlalchemy.orm import relationship

from app.db.base_class import Base


class Tag(Base):
    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(50), nullable=False,unique=True)

