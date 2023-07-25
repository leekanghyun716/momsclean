package com.mom.client.user.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String joinForm(Model model) throws Exception {
        model.addAttribute("user", new User());
        return "client/user/joinForm";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@Valid User user, BindingResult bindingResult, RedirectAttributes redirectAttributes) throws Exception {
        // 비밀번호 확인
        if (!user.getUserPw().equals(user.getConfirmPassword())) {
            bindingResult.rejectValue("confirmPassword", "error.user", "입력한 비밀번호가 다릅니다");
        }

        if (bindingResult.hasErrors()) {
            return "client/user/joinForm";
        }

        userService.registerUser(user);
        redirectAttributes.addFlashAttribute("alertMessage", "회원가입 완료\n로그인 페이지로 이동합니다.");
        return "redirect:/client/login/login";
    }

    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String handleError() {
        return "error/default";
    }
    
    // 이용약관 화면 보여주는 메서드
    @RequestMapping(value = "/agreement", method = RequestMethod.GET)
    public String showAgreement(Model model) {
        model.addAttribute("user", new User());
        return "client/user/agreement";
    }

    @RequestMapping(value = "/agreement", method = RequestMethod.POST)
    public String handleAgreement(@Valid User user, BindingResult bindingResult, RedirectAttributes redirectAttributes) throws Exception {
        if (!user.isAgreement1() || !user.isAgreement2()) {
            redirectAttributes.addFlashAttribute("alertMessage", "모든 약관에 동의 후 가입이 가능합니다.");
            return "redirect:/user/agreement"; // 이용약관에 전부 동의하지 않은 경우 다시 이용약관 페이지로 이동
        }

        // 이용약관에 전부 동의한 경우 가입폼으로 이동
        return "redirect:/user/joinForm";
    }
}
