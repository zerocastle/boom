package com.ys.project.controller.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ys.project.projectDTO.Criteria2;
import com.ys.project.projectDTO.MemberProductionList;
import com.ys.project.projectDTO.PageDTO2;
import com.ys.project.projectVO.MemberVO;
import com.ys.project.projectVO.PartnerVO;
import com.ys.project.projectVO.ProductionVO;
import com.ys.project.service.sellingUpdate.ISellingUpdateService;

import lombok.AllArgsConstructor;

/*
 * 전반적인 상품 관련 내역 확인
 */

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
	public String sell_productManage(Model model, HttpServletRequest request , Criteria2 cri) {
		JSONObject object;
		JSONArray array = new JSONArray();
		
		MemberVO memberVO = null;
		Map map = new HashMap<>(); // 값 넘겨 줄때 쓰일 녀석
//		MemberProductionList memberProductionList = null;
		List<MemberProductionList> list = null;

		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("loginSession");
		int m_num = memberVO.getM_num();
		logger.info("매니저로 이동" + m_num);

		int pro_num = 0;
		String title;
		String state_msg;
		int price;
		String cate_code;
		String path;
		
		//서비스 넘겨줄떄 사전작업
		map.put("pageNum",cri.getPageNum());
		map.put("amount" , cri.getAmount());
		map.put("m_num",m_num);
		
		// 서비스 값 넘겨주는 구간
		list = service.getMemberProductionList(map);

		for (int i = 0; i < list.size(); i++) {
			object = new JSONObject();

			path = list.get(i).getUploadPath() + "\\s_" + list.get(i).getUuid() + "_" + list.get(i).getFileName();
			pro_num = list.get(i).getPro_num();
			title = list.get(i).getTitle();
			state_msg = list.get(i).getState_msg();
			price = list.get(i).getPrice();
			cate_code = list.get(i).getCate_code();

			object.put("path", path);
			object.put("pro_num", pro_num);
			object.put("title", title);
			object.put("state_msg", state_msg);
			object.put("price", price);
			object.put("cate_code", cate_code);

			array.add(object);

		}

		logger.info("상품관리 : " + array);

		// 상품처리
		model.addAttribute("productList", array.toString());
		
		//페이징 처리
		model.addAttribute("pageMaker" , new PageDTO2(cri, service.getMemberProductionTotalCount(m_num))); 
		

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
	public String uploadProduct(ProductionVO productionVO, Model model, RedirectAttributes rttr) {

		if (productionVO.getUploadVOList() != null) {
			productionVO.getUploadVOList().forEach(attach -> logger.info("" + attach));
		}
		logger.info("야 뭐가 넘 어 옴??" + productionVO);

		service.insert(productionVO);

		logger.info("========================================");

		return "redirect:/selling/selling";
	}

}
