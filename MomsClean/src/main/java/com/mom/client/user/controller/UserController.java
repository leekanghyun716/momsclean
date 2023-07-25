package com.mom.client.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mom.client.login.UserInfo;
import com.mom.client.user.User;
import com.mom.client.user.service.UserService;

import lombok.extern.java.Log;
@Log
@Controller
@RequestMapping("/user")
public class UserController {
    private UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/joinForm", method = RequestMethod.GET)
    public String joinForm(Model model,HttpSession session) throws Exception {
        model.addAttribute("user", new User());
        UserInfo userInfo=(UserInfo)session.getAttribute("user");
        log.info(userInfo.getUserId());
        return "client/user/joinForm";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(User user, RedirectAttributes redirectAttributes) throws Exception {
        userService.registerUser(user);
        // 회원 가입 완료 메시지를 Flash Attribute로 저장
        redirectAttributes.addFlashAttribute("alertMessage", "회원가입 완료\n로그인 페이지로 이동합니다.");
        return "redirect:/client/login/login"; // 회원 가입 성공 시 로그인 페이지로 리다이렉트
    }

    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String handleError() {
        return "error/default"; // 기본 에러 페이지로 이동
    }
}
