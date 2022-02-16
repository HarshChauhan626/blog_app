import logging

from app.db.init_db import init_db
from app.db.session import SessionLocal
from app.models import User

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


def init() -> None:
    db = SessionLocal()
    init_db(db)
    q1=db.query(User).all()
    print(q1)



def main() -> None:
    logger.info("Creating initial data")
    init()
    logger.info("Initial data created")
