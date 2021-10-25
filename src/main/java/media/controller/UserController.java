package media.controller;

import media.entity.User;
import media.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@Controller
@RequestMapping("/manage")
public class UserController {

    @Resource
    UserService userService;

    /*跳转到登录页面*/
    @RequestMapping("/loginview.action")
    public String loginView() throws Exception {
        return "login";
    }

    /*用户登录*/
    //做AJax请求
    @ResponseBody
    @RequestMapping("/login.action")
    public String login(String username, String password, Model model,
                        @RequestParam(value = "verifycode", defaultValue = "") String verifycode,
                        HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
        // 通过账号和密码查询用户是否存在
        User user = userService.findUser(username, password);

        String inputVerfiCode = request.getParameter("verifycode");
        System.out.println("用户输入的验证码的值：=====:" + inputVerfiCode);
        String verifyCodeValue = (String) session.getAttribute("verifyCodeValue");
        System.out.println("session中的 验证码的值：" + verifyCodeValue);

        if (user == null) {
            return "false";
        }
        if (inputVerfiCode == "") {
            return "noverify";
        }
        if (!verifyCodeValue.equals(inputVerfiCode.toUpperCase()) && inputVerfiCode != "") {
            return "wrong";
        }

        model.addAttribute("user", user);
        session.setAttribute("USER_SESSION", user);
        System.out.println("------------------" + "用户" + username + "登录了" + "--------------------");
        System.out.println("------------------" + "用户信息为" + user.toString() + "--------------------");

        if (username.equals("admin")) {
            return "admin";
        }
        return "true";
    }


    /*跳转至用户注册页面*/
    @RequestMapping("/regist.action")
    public String regist() {
        return "regist";
    }

    /*输入用户名后进行判断*/
//    @ResponseBody
//    @RequestMapping("/tryregist.action")
//    public String tryregist(@RequestParam(value = "username", defaultValue = "") String username) {
//        User user = userService.findByUsername(username);
//        if (user != null) {
//            return "false";
//        } else if (user == null) {
//            return "true";
//        }
//        return "again";
//    }

    /*判断能否注册成功*/
    @ResponseBody
    @RequestMapping("/doregist.action")
    public String addUser(User user, Model model, HttpSession session, HttpServletRequest request,
                          @RequestParam(value = "verifycode", defaultValue = "") String verifycode) {
        
        int i = userService.addUser(user);
        String inputVerfiCode = request.getParameter("verifycode");
        String verifyCodeValue = (String) session.getAttribute("verifyCodeValue");
        System.out.println("用户输入的注册信息为:{" + "(用户名:" + user.getUsername() + ")++++++(第一次输入密码:" + user.getPassword()
                + ")++++++(第二次输入密码" + user.getPasswordagain() + ")}");
        System.out.println("session中的 验证码的值：" + verifyCodeValue);
        System.out.println("用户输入的验证码的值：=====:" + inputVerfiCode);

        //判断用户输入的注册信息合法之前判断验证码是否正确
        if (!verifyCodeValue.equals(inputVerfiCode.toUpperCase())) {
            return "-100";
        }
        if (i > 0) {
            return "1";
        } else if (i == -1) {
            return "-1";
        } else if (i == -2) {
            return "-2";
        } else if (i == -3) {
            return "-3";
        } else if (i == -4) {
            return "-4";
        } else if (i == -5) {
            return "-5";
        } else if (i == -6) {
            return "-6";
        } else if (i == -7) {
            return "-7";
        } else if (i == -8) {
            return "-8";
        } else if (i == -41) {
            return "-41";
        }
        return "-40";
    }

    /*注册成功页面*/
    @RequestMapping("/registsuccess.action")
    public String registSuccess() {
        return "registsuccess";
    }

    /*退出登录*/
    @RequestMapping(value = "/logout.action")
    public String logout(HttpSession session) {
        // 清除Session
        session.invalidate();
        // 重定向到登录页面的跳转方法
        return "redirect:loginview.action";
    }

    /*显示用户管理页面*/
    @RequestMapping("/usermanage.action")
    public String userManage(Model model, HttpServletRequest request) throws Exception {

        List list = userService.getUserList();
        model.addAttribute("list", list);
        model.addAttribute("url", "usermanage");
        return "manage/user_manage";
    }
}
