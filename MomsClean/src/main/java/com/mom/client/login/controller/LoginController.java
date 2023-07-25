package com.mom.client.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mom.client.login.Login;
import com.mom.client.login.UserInfo;
import com.mom.client.user.service.UserService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/client/login")
public class LoginController {

	private final UserService userService;

	@Autowired
	public LoginController(UserService userService) {
		this.userService = userService;
	}

	// 로그인 페이지를 보여주는 메서드
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void showLoginForm(Model model) {
		model.addAttribute("login", new Login());

	}

	// 로그인 처리를 수행하는 메서드
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void processLogin(String username, String password, HttpSession session, Model model,HttpServletRequest request) {
		// 여기서 로그인 처리 로직을 구현
		log.info(username);
		UserInfo userInfo = userService.getUserByIdAndPassword(username, password);

	    if (userInfo != null && userInfo.getUserId().equals(username) && userInfo.getUserPw().equals(password)) {
	        // 로그인 성공 시 기존 세션을 무효화
	        //session.invalidate();

	        // 새로운 세션 생성
	        HttpSession newSession = session;
	        newSession.setAttribute("user", userInfo);
	        UserInfo userInfo2 = (UserInfo)session.getAttribute("user");
	        log.info( userInfo2.getUserId());
	        // 로그인 성공 시 마이페이지로 이동
	         // 마이페이지 경로로 리다이렉트
	    } else {
	        // 로그인 실패 시 에러 메시지를 모델에 추가하고 다시 로그인 페이지로 이동
	        model.addAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
	       
	    }
	    
	}

	
}
