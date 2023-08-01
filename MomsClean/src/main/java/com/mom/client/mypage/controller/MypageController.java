package com.mom.client.mypage.controller;



import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mom.client.login.UserInfo;
import com.mom.client.mypage.Mypage;
import com.mom.client.mypage.PageRequest;
import com.mom.client.mypage.Pagination;
import com.mom.client.mypage.service.MypageInfoService;
import com.mom.client.mypage.service.MypageReserveInfoService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("client/mypages")
public class MypageController {

	@Autowired
	MypageInfoService infoservice;
	
	@Autowired
	MypageReserveInfoService reserveservice;

	//내정보 보기 페이지 
	@RequestMapping(value="/myPageInfo", method=RequestMethod.GET)
	public void view( HttpServletRequest request,  Model model) throws Exception{
		
		
		HttpSession Session = request.getSession();
        
        UserInfo userInfo = (UserInfo) Session.getAttribute("user");
        
        if(userInfo != null) {
        	 String userId = userInfo.getUserId();     
        	 
        	 Mypage mypage = infoservice.view(userId);
        	 
        	 model.addAttribute("mypage", mypage);
        
        }
	}
	
	// 내정보 수정 페이지
	@RequestMapping(value = "/myPageModify", method = RequestMethod.GET)
	public void ModifyForm(HttpServletRequest request, Model model) throws Exception {
		
		HttpSession Session = request.getSession();
        
        UserInfo userInfo = (UserInfo) Session.getAttribute("user");
        
        if(userInfo != null) {
        	 String userId = userInfo.getUserId();     
        	 
        	 Mypage mypage = infoservice.view(userId);
        	 
        	 model.addAttribute("mypage", mypage);
	}
	}
	// 내정보 수정 처리
	@RequestMapping(value = "/myPageModify", method = RequestMethod.POST)
	public String Modify(HttpServletRequest request, @ModelAttribute("mypage") Mypage mypage) throws Exception {
		
           HttpSession Session = request.getSession();
        
            UserInfo userInfo = (UserInfo) Session.getAttribute("user");
        
            if(userInfo != null) {
            	
        	mypage.setUserId(userInfo.getUserId());
        	
        	 infoservice.modify(mypage);
        	 
        	    return "redirect:/client/mypages/myPageInfo";
            }else {
            	return "redirect:/client/mypages/myPageInfo";
            }
            
           
	}	 
	
	// 회원탈퇴 (유지->탈퇴)
	@RequestMapping(value = "/withdrawSuccess", method = RequestMethod.POST)
	public String Withdraw(HttpServletRequest request,  @ModelAttribute("mypage") Mypage mypage) throws Exception {
		
        HttpSession Session = request.getSession();
        
        UserInfo userInfo = (UserInfo) Session.getAttribute("user");
    
        if(userInfo != null) {
        	
    	mypage.setUserId(userInfo.getUserId());
    	 infoservice.withdraw(userInfo.getUserId());
    	 
    	    return "redirect:/client/page";
        }else {
        	return "redirect:/client/page";
        }
        
       
}	 
		
	
		
		
		
		
	
	// 예약현황 리스트
	@RequestMapping(value = "/myPageReserveList", method = RequestMethod.GET)
	public void ListForm(Model model, HttpServletRequest request, @ModelAttribute("pgrq") PageRequest pageRequest) throws Exception {
		
          HttpSession Session = request.getSession(); 
        
        UserInfo userInfo = (UserInfo) Session.getAttribute("user");
        
        if(userInfo != null) {
        	 String userId = userInfo.getUserId();  
        	 	
        	 model.addAttribute("list" , reserveservice.list(userId, pageRequest.getPage(), pageRequest.getSizePerPage()));
        	 
        	 Pagination pagination = new Pagination();
        	 pagination.setPageRquest(pageRequest);
        	 pagination.setTotalCount(reserveservice.count());
        	 model.addAttribute("pagination", pagination);
	}		
}
	
	// 예약현황 상세페이지
	@RequestMapping(value = "/myPageReserveInfo", method = RequestMethod.GET)
	public void myReserveInfoForm(String reserveNo, Model model) throws Exception {
		
		model.addAttribute("read", reserveservice.read(reserveNo));

	}

	
	//예약취소요청
	@RequestMapping(value = "/myPageReserveInfo", method = RequestMethod.POST)
	public String cancelRequest(@RequestParam("reserveNo") String reserveNo, HttpServletRequest request, Model model)throws Exception {
		   
		 HttpSession Session = request.getSession();
	        
         UserInfo userInfo = (UserInfo) Session.getAttribute("user");
     
         if(userInfo != null) {
        	 String userId = userInfo.getUserId();     
        		
     	     reserveservice.cancelRequest(reserveNo, userId);
     	     
     	    model.addAttribute("read", reserveservice.read(userId));
     	
           return "/myPageReserveInfo";
     	
         }
         return null;

	}

	
	//로그아웃
	@RequestMapping(value="/logoutSuccess", method=RequestMethod.GET)
	public String logout(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession(false);
		
        
        if(session != null) {
        	
			session.invalidate();
	
		}
		return "/client/mypages/logoutSuccess";
		   	 
	}
	}

