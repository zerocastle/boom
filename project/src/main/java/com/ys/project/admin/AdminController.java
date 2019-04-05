package com.ys.project.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ys.project.admin.service.INoticeBoardService;
import com.ys.project.memberVO.Criteria;
import com.ys.project.memberVO.NoticeBoardVO;
import com.ys.project.memberVO.PageDTO;

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
	public void noticeBoard(Criteria cri, Model model) {

		log.info("list" + cri);
		model.addAttribute("list", service.getList(cri));
		log.info("page : " + service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotalCount())); // 여기에다가 count(*) 을 적용

	}

	@GetMapping("/noticeRegister")
	public String noticeRegister(Model model) {
		log.info("레지스터로 이동..");
		return "/admin/noticeBoardRegister";
	}

	@PostMapping("/noticeRegister")
	public String noticeRegister(NoticeBoardVO board, RedirectAttributes rttr) {
		log.info("레지스터 넘온 값 : " + board);
		service.register(board);
		rttr.addFlashAttribute("reult", board.getNo_num());
		return "redirect:/admin/noticeBoard";
	}

	@GetMapping("/noticeGet")
	public String get(@RequestParam("no_num") long no_num, Model model) {
		log.info("/get");
		model.addAttribute("board", service.get(no_num));
		return "/admin/noticeBoardGet";
	}

	@GetMapping("/modify")
	public String modify(@RequestParam("no_num") long no_num, Model model) {
		log.info("modify 이동");
		model.addAttribute("board", service.get(no_num));
		return "/admin/noticeBoardModify";
	}

	@PostMapping("/modify")
	public String modify(NoticeBoardVO board, RedirectAttributes rttr) {
		log.info("modify : " + board);

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/admin/noticeBoard";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("no_num") long no_num, RedirectAttributes rttr) {
		log.info("remove : " + no_num);

		if (service.remove(no_num)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/admin/noticeBoard";
	}

}