package com.ys.project.controller.member;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ys.project.projectVO.PartnerVO;
import com.ys.project.projectVO.ProductionVO;
import com.ys.project.service.sellingUpdate.ISellingUpdateService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "selling")
public class SellingController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private ISellingUpdateService service; 

	// 판매하기로 이동
	@RequestMapping(value = "selling", method = RequestMethod.GET)
	public String sellGet(Model model) {

		logger.info("판매하기로 이동 한다.");
		return "sell/selling";

	}

	// 상품 관리로 이동
	@RequestMapping(value = "sell_productManage", method = RequestMethod.GET)
	public String sell_productManage(Model model) {

		logger.info("매니저로 이동");

		return "/sell/sell-ProductManage";

	}

	// 쳇 리스트
	@RequestMapping(value = "chatList", method = RequestMethod.GET)
	public String chatList(Model model) {

		logger.info("채팅목록 이동");

		return "sell/chatList";

	}

	// 구매내역
	@RequestMapping(value = "purchaseList", method = RequestMethod.GET)
	public String purchaseList(Model model) {

		logger.info("구매 내역 이동");

		return "sell/purchaseList";

	}

	// 판매내역
	@RequestMapping(value = "sellList", method = RequestMethod.GET)
	public String sellList(Model model) {

		logger.info("판매 내역 이동");

		return "sell/sellList";

	}

	// 탈퇴하기
	@RequestMapping(value = "memberOut", method = RequestMethod.GET)
	public String memberOut(Model model) {

		logger.info("회원탈퇴");

		return "sell/memberOut";

	}

	// 직플레이스 선택하기
	@GetMapping("directPick")
	public String directPick(Model model) {
		List<PartnerVO> list = service.directPickList();
		model.addAttribute("partnerList", list);
		return "/pick/directPick";

	}

	// 상품 등록하기
	@PostMapping("uploadProduct")
	public String uploadProduct(ProductionVO productionVO, Model model , RedirectAttributes rttr) {

		if (productionVO.getUploadVOList() != null) {
			productionVO.getUploadVOList().forEach(attach -> logger.info("" + attach));
		}
		logger.info("야 뭐가 넘 어 옴??" + productionVO);
		
		service.insert(productionVO);

		logger.info("========================================");

		return "redirect:/selling/selling";
	}

}
