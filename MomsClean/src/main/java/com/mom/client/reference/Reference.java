package com.mom.client.reference;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Reference {
	
	private int referenceNo;
	private String userNo;
	private String referenceTitle;
	private String referenceContent;
	private Date referenceDate;
}
