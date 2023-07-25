package com.mom.client.user;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class User {
private int userNo;
	
	@NotBlank
	private String userId;
	
	@NotBlank
	private String userPw;
	
	//@NotBlank
	//private String confirmPassword;
	
	@NotBlank
	private String userName;
	
	@NotBlank
	private String userPhone;
	
	@NotBlank
	private String userEmail;
	
	private String emailAuth;
	@NotBlank
	@NotNull
	private String userDivision;

}
