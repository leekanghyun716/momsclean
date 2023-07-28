package com.mom.client.mainpage.controller;

import org.springframework.stereotype.Controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/client")
public class MainPageController{
	 @RequestMapping(value="/page",method = RequestMethod.GET)
	 public void page() {
		 
	 }
}
