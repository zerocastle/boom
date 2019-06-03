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

	// ��ǰ������� �̵�
	@RequestMapping(value = "/index_productList", method = RequestMethod.GET)
	public String productList(Model model , String cate_code , Criteria3 cri3 ,  String order) {
		
//		Stack<IndexProductionDTO> stack = new Stack<>(); // ���� �������� ����� �Ҷ� 
		
		log.info("��ǰ��Ϸ� �̵� �Ѵ�.");
		/* String order = "desc"; */
		int pageNum = cri3.getPageNum();
		int amount = cri3.getAmount();
		
		List<IndexProductionDTO> dto = service.sort(order, cate_code, pageNum, amount);

		log.info("�� �� �ѿ��� ? " + dto);
		model.addAttribute("production",JSONArray.fromObject(dto));
		model.addAttribute("pageMaker", new PageDTO3(cri3, service.getTotalCount(cate_code))); // ���⿡�ٰ� count(*) �� ����
//		model.addAttribute("switchPage","../floatSection/productList.jsp");
		return "/mainIndex/index-productList";

	}

	// ��ǰ�󼼺���� �̵�
	@RequestMapping(value = "/index_productView", method = RequestMethod.GET)
	public String productView(Model model, @RequestParam int pro_num) {

//			logger.info("��ǰ��Ϸ� �̵� �Ѵ�.");

		log.info("��ǰ �󼼺��� ���� �ѿ���??" + pro_num);
		
		List<Map<String,Object>> list = service.totalFineByPro(pro_num);
		log.info(""+list);
		
		System.out.println("fuck :===================================== " + JSONArray.fromObject(list));
		model.addAttribute("productView",JSONArray.fromObject(list));
		
		return "/mainIndex/index-productView";

	}

}
