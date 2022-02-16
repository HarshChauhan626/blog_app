from sqlalchemy import DateTime, Integer, String, Column, Boolean
from sqlalchemy.orm import relationship
import datetime

from app.db.base_class import Base


class User(Base):
    id = Column(Integer, primary_key=True, index=True)
    username = Column(Integer, nullable=False)
    first_name = Column(String(256), nullable=True)
    middle_name = Column(String(256), nullable=True)
    last_name = Column(String(256), nullable=True)
    mobile = Column(String(256), nullable=True)
    registered_at = Column(DateTime, default=datetime.datetime.utcnow, nullable=False)
    last_login = Column(DateTime, default=datetime.datetime.utcnow, nullable=False)
    email = Column(String, index=True, nullable=False)
    intro = Column(String, nullable=True)

    is_superuser = Column(Boolean, default=False)
    blogs = relationship(
        "Blog",
        cascade="all,delete-orphan",
        back_populates="author",
        uselist=True,
    )
    #
    # likes = relationship(
    #     "Like",
    #     cascade="all,delete-orphan",
    #     back_populates="author",
    #     uselist=True
    # )
    #
    # comments = relationship(
    #     "Comment",
    #     cascade="all,delete-orphan",
    #     back_populates="author",
    #     uselist=True
    # )

    # New addition
    hashed_password = Column(String, nullable=False)
