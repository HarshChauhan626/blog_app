from typing import Optional, Sequence

from pydantic import BaseModel


# https://www.researchgate.net/figure/The-Generated-Social-Network-Schema-SIB_fig3_254811630

# http://www.tellnet.eun.org/widget/web/tellnet/news;jsessionid=530179A1A594A8C8826B707B17AB203A?p_p_id=33&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&_33_struts_action=%2Fblogs%2Fview&_33_delta=30&_33_keywords=&_33_advancedSearch=false&_33_andOperator=true&cur=2


# https://www.google.com/search?q=social+media+database+design&rlz=1C1RXQR_enIN982IN982&sxsrf=APq-WBu973uiRr9OwL8UBLTnCyWDYVA1OA:1644916196115&source=lnms&tbm=isch&sa=X&ved=2ahUKEwj56aysroH2AhXv4jgGHZFbD8oQ_AUoAXoECAEQAw&biw=1260&bih=573&dpr=1.53#imgrc=MM8BDbSEJh6iWM

# https://www.quora.com/What-does-the-Facebook-user-LIKE-database-look-like

# https://www.drupal.org/files/er_db_schema_drupal_7.png

# https://stackoverflow.com/questions/3844477/social-web-application-database-design-how-can-i-improve-this-schema

class PostLikeBase(BaseModel):
    blog_id: Optional[int]
    user_id: Optional[int]


class PostLikeCreate(PostLikeBase):
    ...


class PostLikeDelete(PostLikeBase):
    ...


class PostLikeInDBBase(PostLikeBase):
    id: int

    class Config:
        orm_mode = True


class PostLike(PostLikeInDBBase):
    ...
