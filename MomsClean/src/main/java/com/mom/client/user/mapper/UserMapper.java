package com.mom.client.user.mapper;

import com.mom.client.login.UserInfo;
import com.mom.client.user.User;

public interface UserMapper {
    void insertUser(User user);

	UserInfo getUserByIdAndPassword(String userId, String userPw);
}
