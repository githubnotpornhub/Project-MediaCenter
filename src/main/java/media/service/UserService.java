package media.service;


import media.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    // 通过账号和密码查询用户
    User findUser(String username, String password);

    User findByUsername(String username);

    List<User> getUserList();

    int addUser(User user);
}
