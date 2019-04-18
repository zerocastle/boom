package com.ys.project.controller.member;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ys.project.service.production.ProductionService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/")
public class ProductController {

	private static final Logger log = LoggerFactory.getLogger(ProductController.class);

	// 상품목록으로 이동
	@RequestMapping(value = "index_productList", method = RequestMethod.GET)
	public String productList(Model model) {

//			logger.info("상품목록로 이동 한다.");
		return "mainIndex/index-productList";

	}

	// 상품상세보기로 이동
	@RequestMapping(value = "index_productView", method = RequestMethod.GET)
	public String productView(Model model) {

//			logger.info("상품목록로 이동 한다.");
		return "mainIndex/index-productView";

	}

}
