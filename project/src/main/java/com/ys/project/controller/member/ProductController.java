package com.ys.project.controller.member;

import java.util.List;
import java.util.Map;
import java.util.Stack;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ys.project.projectDTO.Criteria3;
import com.ys.project.projectDTO.IndexProductionDTO;
import com.ys.project.projectDTO.PageDTO3;
import com.ys.project.service.production.IProductionService;

import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/production/**")
public class ProductController {

	private static final Logger log = LoggerFactory.getLogger(ProductController.class);

	private IProductionService service;

	// 상품목록으로 이동
	@RequestMapping(value = "/index_productList", method = RequestMethod.GET)
	public String productList(Model model , String cate_code , Criteria3 cri3 ,  String order) {
		
//		Stack<IndexProductionDTO> stack = new Stack<>(); // 오름 차순으로 볼라고 할때 
		
		log.info("상품목록로 이동 한다.");
		/* String order = "desc"; */
		int pageNum = cri3.getPageNum();
		int amount = cri3.getAmount();
		
		List<IndexProductionDTO> dto = service.sort(order, cate_code, pageNum, amount);

		log.info("값 모가 넘오옮 ? " + dto);
		model.addAttribute("production",JSONArray.fromObject(dto));
		model.addAttribute("pageMaker", new PageDTO3(cri3, service.getTotalCount(cate_code))); // 여기에다가 count(*) 을 적용
//		model.addAttribute("switchPage","../floatSection/productList.jsp");
		return "/mainIndex/index-productList";

	}

	// 상품상세보기로 이동
	@RequestMapping(value = "/index_productView", method = RequestMethod.GET)
	public String productView(Model model, @RequestParam int pro_num) {

//			logger.info("상품목록로 이동 한다.");

		log.info("상품 상세보기 뭐가 넘오옴??" + pro_num);
		
		List<Map<String,Object>> list = service.totalFineByPro(pro_num);
		log.info(""+list);
		
		System.out.println("fuck :===================================== " + JSONArray.fromObject(list));
		model.addAttribute("productView",JSONArray.fromObject(list));
		
		return "/mainIndex/index-productView";

	}

}
