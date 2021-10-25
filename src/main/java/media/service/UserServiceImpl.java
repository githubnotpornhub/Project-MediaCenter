package media.service;

import media.dao.UserMapper;
import media.entity.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


@Service
public class UserServiceImpl implements UserService {

    @Resource
    UserMapper userMapper;

    @Override
    public User findUser(String username, String password) {
        return userMapper.findUser(username, password);
    }

    @Override
    public User findByUsername(String username) {
        return userMapper.findByUsername(username);
    }

    @Override
    public List<User> getUserList() {
        return userMapper.getUserList();
    }

    //用户注册
    @Transactional
    @Override
    public int addUser(User user) {

        int i = 0;
        String username = user.getUsername();
        String password = user.getPassword();
        String passwordagain = user.getPasswordagain();
        user = userMapper.findByUsername(username);

        //账号格式要求(字母数字混合4位以上最多25位，可使用特殊符号_-?!.@)
        String okusername="^[a-zA-Z0-9-_.@!?]{4,25}$";
        Pattern pattern0=Pattern.compile(okusername);
        Matcher matcher0= pattern0.matcher(username);

        //密码格式要求(须同时包含数字和英文字母且大于8位小于16位，可使用特殊符号_-?!.@)
        String okpassword = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z-_.@!?]{8,16}$";
        Pattern pattern = Pattern.compile(okpassword);
        Matcher matcher = pattern.matcher(password);

        //账号已存在，密码格式不正确，两次密码不相同
        if (user != null && !matcher.matches() && !password.equals(passwordagain)) {
            return i = -1;
        }
        //账号已存在，密码格式不正确
        if (user != null && !matcher.matches() && username != "" && password != "") {
            return i = -2;
        }
        //账号已存在，两次密码不相同
        if (user != null && !password.equals(passwordagain) && passwordagain != "") {
            return i = -3;
        }
        //密码格式不正确，两次密码不相同
        if (!matcher.matches() && !password.equals(passwordagain)) {
            return i = -4;
        }
        //账号格式不正确，密码格式不正确
        if (!matcher0.matches() && !matcher.matches()){
            return i=-41;
        }
        //账号格式不正确
        if (!matcher0.matches() && username!=""){
            return i=-40;
        }
        //账号已存在
        if (user != null) {
            return i = -5;
        }
        //密码格式不正确
        if (!matcher.matches() && password != "") {
            return i = -6;
        }
        //两次密码不相同且有输入
        if (!password.equals(passwordagain) && passwordagain != "") {
            return i = -7;
        }
        //没有再次输入密码
        if (passwordagain == "") {
            return i = -8;
        }

        //通过验证，输入的账号密码可用于用户注册
        User u = new User();
        u.setUsername(username);
        u.setPassword(password);
        i = userMapper.addUser(u);
        System.out.println("注册用户的信息为---------------" + u.toString());
        return i;//1
    }
}
