package com.mom.client.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mom.client.user.service.UserService;

@Service
public class LoginServiceImpl implements LoginService {

	private final UserService userService;

	@Autowired
	public LoginServiceImpl(UserService userService) {
		this.userService = userService;
	}

	@Override
	public boolean authenticate(String username, String password) {
		//User user = userService.getUserByIdAndPassword(username, password);
		//return user != null;
		return  false;
	}
}
