
package com.mom.client.notice.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mom.client.notice.Notice;
import com.mom.client.notice.PageRequest3;
import com.mom.client.notice.Pagination3;
import com.mom.client.notice.service.NoticeService;

import lombok.extern.java.Log;



@Log
@Controller
public class NoticeController  {
	
	@Autowired
	private NoticeService service;
	







	   // 공지사항 상세 페이지
	   @RequestMapping(value="/client/notice/noticeDetail", method = RequestMethod.GET)
	   public void read(int noticeNo, Model model) throws Exception{
		   	
		   		model.addAttribute(service.read(noticeNo));
		
		
		
	   }
	
		
			
	
					
	   
	
	
		
		//공지사항 목록 페이지
				/*@RequestMapping(value="/client/notice/noticeList1", method = RequestMethod.GET)
				public void noticeListform1(Model model) throws Exception{
					
				   			
				   model.addAttribute("list",service.list());
					
				}*/
	   
		//페이징 요청 정보를 매개 변수로 받고 다시 뷰에 전달한다,공지사항목록페이지
		
		
		  @RequestMapping(value="/client/notice/noticeList",method = RequestMethod.GET)
		  public void list(@ModelAttribute("pgrq") PageRequest3 pageRequest, Model
		  model,int page) throws Exception{ //뷰에 페이징 처리를 한 게시글 목록을 전달한다.
		  model.addAttribute("list",service.list(pageRequest));
		  
		  //페이징 네비게이션 정보를 뷰에 전달한다.
		  Pagination3 pagination = new Pagination3();
			 pagination.setPageRequest(pageRequest); 
		  pagination.setTotalCount(service.count()); 
			
			  if(pagination.isNext()) {
			  log.info(Integer.toString(pagination.getStartPage())); 
			  log.info("널아님"); 
			  
			  }else { 
				  
			  log.info(Integer.toString(pagination.getStartPage())); 
			  log.info("널");
			  
			  }
			  
			
		  model.addAttribute("pagination", pagination);
		  
		  
		  }
		 
			
			
					
				
		// 회사소개 페이지
		
		@RequestMapping(value="/client/intro/commpanyintr", method = RequestMethod.GET)
		public void Commpanyintr (Model model) throws Exception{
			
			Notice notice = new Notice();
   			
			   model.addAttribute(notice);
			
		
		}
		
		
		//공지사항 목록 페이지
		/*
		 * @RequestMapping(value="/client/notice/noticeList", method=RequestMethod.GET)
		 * public void list(Model model)throws Exception{
		 * model.addAttribute("noticeList",service.list()); 
		 * }
		 */
		
		
	
}
		
		
	
	
	
	
		


	// 공지사항 상세 페이지
	/*@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read() throws Exception {
		
	}*/

	// 공지사항 수정 페이지
	/*@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyForm() throws Exception {
		
	}*/

	

 
