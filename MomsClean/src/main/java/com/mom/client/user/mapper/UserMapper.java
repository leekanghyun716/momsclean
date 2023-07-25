package com.mom.client.user.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.mom.client.login.UserInfo;
import com.mom.client.user.User;
@Mapper
public interface UserMapper {
    void insertUser(User user);

	UserInfo getUserByIdAndPassword(String userId, String userPw);
}
