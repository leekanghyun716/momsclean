package com.mom.client.user.mapper;

import java.util.Map;

import com.mom.client.login.UserInfo;
import com.mom.client.user.User;

public interface UserMapper {
    void insertUser(User user);

	UserInfo getUserByIdAndPassword(String userId, String userPw);

	int isUserIdDuplicate(String userId);

	int checkDuplicateId(String userId);

	String findIdByNameAndEmail(String userName, String userEmail);

	 String findPwByIdNameAndEmail(String userId, String userName, String userEmail);
}
