package com.ys.project;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "selling")
public class SellingController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	// 판매하기로 이동
	@RequestMapping(value = "selling", method = RequestMethod.GET)
	public String sellGet(Model model) {

		logger.info("판매하기로 이동 한다.");
		return "sell/selling";

	}
	
	@RequestMapping(value = "sellingHome", method = RequestMethod.GET)
	public String sellHomeGet(Model model) {

		logger.info("메인 홈으로 ㄱㄱ");

		return "index";

	}
	
	
	//상품 관리로 이동
	@RequestMapping(value = "sell_productManage", method = RequestMethod.GET)
	public String sell_productManage(Model model) {

		logger.info("매니저로 이동");

		return "/sell/sell-ProductManage";

	}

}
