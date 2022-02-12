from app.crud.base import CRUDBase
from app.models.blog import Blog
from app.schemas.blog import BlogCreate, BlogUpdate


class CRUDBlog(CRUDBase[Blog, BlogCreate, BlogUpdate]):
    ...


blog = CRUDBlog(Blog)



