from pydantic import BaseModel


class GetBlogRequest(BaseModel):
    # start_index:int
    # end_index:int
    # Blogs with id > current_index will be returned
    current_index: int
    list_type:int

