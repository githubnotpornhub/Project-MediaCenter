package media.dao;

import media.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
	//获取用户
     List<User> getUser() throws Exception;

	 User findUser(@Param("username") String username, @Param("password") String password);

	 User findByUsername(@Param("username")String username);

	 List<User> getUserList();

	int addUser(User user);
}
