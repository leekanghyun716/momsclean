package com.mom.client.reference.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mom.client.reference.Reference;
import com.mom.client.reference.service.ReferenceService;

@Controller
@RequestMapping("client/reference")
public class ReferenceController {
	@Autowired
	private ReferenceService service;

	// 문의사항 게시글 등록페이지
	@RequestMapping(value = "/referenceRegister", method = RequestMethod.GET)

	public void registerForm(Model model) throws Exception {

		Reference reference = new Reference();
		String referenceName = "안휘";

		model.addAttribute("referenceName", referenceName);

		model.addAttribute("reference", reference);
	}

	// 문의사항 등록 처리
	@RequestMapping(value = "/referenceRegister", method = RequestMethod.POST)
	public String register(Reference reference, RedirectAttributes rttr) throws Exception {
		service.register(reference);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/client/reference/referenceList";
	}

	// 게시글 목록 페이지
	@RequestMapping(value = "/referenceList", method = RequestMethod.GET)
	public void list(Model model) throws Exception {

		String referenceName = "안휘";

		model.addAttribute("referenceName", referenceName);
		model.addAttribute("referenceList", service.list());
	}
}
