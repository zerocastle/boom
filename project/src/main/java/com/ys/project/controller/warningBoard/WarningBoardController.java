package com.ys.project.controller.warningBoard;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ys.project.projectDTO.Criteria;
import com.ys.project.projectDTO.PageDTO;
import com.ys.project.projectVO.WarningBoardVO;
import com.ys.project.service.warningBoard.IWarningBoardService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/warningBoard/*")
public class WarningBoardController {

	private static final Logger log = LoggerFactory.getLogger(WarningBoardController.class);

	private IWarningBoardService service;

	@GetMapping("/warningBoard")
	public String noticeBoard(Criteria cri, Model model) {

		log.info("list" + cri);
		model.addAttribute("list", service.getListWithPagin(cri));
		log.info("page : " + service.getListWithPagin(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotalCount(cri))); // 여기에다가 count(*) 을 적용
		return "/warningBoard/warningBoard";
	}

	@GetMapping("/register")
	public String noticeRegister(Model model) {
		log.info("레지스터로 이동..");
		return "/warningBoard/warningBoardRegister";
	}

	@PostMapping("/register")
	public String register(WarningBoardVO warningBoardVO, RedirectAttributes rttr) {
		log.info("register : " + warningBoardVO);

		service.register(warningBoardVO);

		rttr.addFlashAttribute("result", warningBoardVO.getWa_num());

		return "redirect:/warningBoard/warningBoard";
	}

	@GetMapping("/get")
	public String get(@RequestParam("wa_num") long wa_num, Model model) {

		model.addAttribute("board", service.get(wa_num));
		
		return "/warningBoard/warningBoardGet";
	}

	@GetMapping("/modify")
	public String modify(@RequestParam("wa_num") long wa_num, Model model) {
		log.info("modify 이동");
		model.addAttribute("board", service.get(wa_num));
		return "/warningBoard/warningBoardModify";
	}

	@PostMapping("/modify")
	public String modify(WarningBoardVO warningBoardVO, Criteria cri, RedirectAttributes rttr) {
		if (service.modify(warningBoardVO)) {
			rttr.addFlashAttribute("result", "success");

		}
		return "redirect:/warningBoard/warningBoard" + cri.getListLink();
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("wa_num") long wa_num, Criteria cri, RedirectAttributes rttr) {
		if (service.remove(wa_num)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/warningBoard/warningBoard" + cri.getListLink();
	}

}
