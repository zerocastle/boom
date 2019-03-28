package com.ys.project.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ys.project.admin.service.INoticeBoardService;
import com.ys.project.admin.service.NoticeBoardServiceImple;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/admin/*")
public class AdminController {
	private static final Logger log = LoggerFactory.getLogger(AdminController.class);
	private INoticeBoardService service;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String adminMainPage(Model model) {
		log.info("관리자 로그인 폼 이동");
		return "login";
	}
	
	// 공지사항으로 이동
	@GetMapping("/noticeBoard")
	public void noticeBoard(Model model) {
		model.addAttribute("list", service.getList());
		log.info("공지사항으로 이동" + service.getList());

	}
	
	@GetMapping("/noticeRegister")
	public void noticeRegister(Model model) {
		log.info("레지스터로 이동..");
	}
	
	// qa로 이동
	@GetMapping("/qa")
	public void qaBoard(Model model) {
		log.info("Q&A로 이동");

	}

	

}
