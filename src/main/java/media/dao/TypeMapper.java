package media.dao;


import media.entity.Type;
import media.entity.User;

import java.util.List;

public interface TypeMapper {
	//获取用户名单
     List<User> getUser() throws Exception;

	 List getTypelist();

	 //通过分组名字获取分组ID并插入数据库
	 Type getTypeId(String typename);

}
