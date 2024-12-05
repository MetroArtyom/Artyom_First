package com.example.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.pojo.User;
import com.example.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
    @Resource
    private UserService userService;

    @GetMapping("/toLogin")
    public String toLogin() {
        return "login";
    }

    // 注入UserService，可以通过@Autowired注解实现依赖注入
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response,
                              @RequestParam("username") String username, @RequestParam("password") String password) {

        // 验证用户名和密码，这里假设UserService中有一个验证方法
        boolean isValidUser = userService.isValidUser(username, password);

        if (isValidUser) {
            // 登录成功，将用户信息存入Session中
            HttpSession session = request.getSession();
            session.setAttribute("username", username);

            // 登录成功后重定向到listContacts.jsp页面

            // 应该重定向到那个列表接口
            return new ModelAndView("redirect:/listContacts");
        } else {
            // 登录失败，返回到登录页面，并提示错误信息
            ModelAndView mav = new ModelAndView("login");
            mav.addObject("message", "用户名或密码错误，请重新登录");
            return mav;
        }
    }

    // 其他Controller方法，例如处理登出逻辑等

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /*注册*/
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView register(@RequestParam("username") String username,
                                 @RequestParam("password") String password,
                                 @RequestParam("rePassword") String rePassword) {
        User user = userService.getByUsername(username);
        if (user == null) {
            if (password.equals(rePassword)) {
                user = new User();
                user.setUsername(username);
                user.setPassword(password);
                userService.addUser(user);
                return new ModelAndView("redirect:/toLogin");
            } else {
                ModelAndView mav = new ModelAndView("register");
                mav.addObject("message", "两次密码不一致，请重新注册");
                return mav;
            }
       } else {
            ModelAndView mav = new ModelAndView("register");
            mav.addObject("message", "用户名已存在，请重新注册");
            return mav;
       }
    }
}
