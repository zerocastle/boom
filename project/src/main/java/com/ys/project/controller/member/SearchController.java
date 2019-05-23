package com.ys.project.controller.member;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ys.project.projectDTO.Criteria3;
import com.ys.project.projectDTO.IndexProductionDTO;
import com.ys.project.projectDTO.PageDTO3;
import com.ys.project.service.production.IProductionService;

import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;

@Controller
@AllArgsConstructor
public class SearchController {

	private static final Logger log = LoggerFactory.getLogger(SearchController.class);

	private IProductionService service;

	@GetMapping(value = "/search")
	public String search(Criteria3 cri3, Model model) {

		log.info("넘오온 값" + cri3);

//		List<IndexProductionDTO> dto = service.searchSort(cri3, type, keyword);
		List<IndexProductionDTO> dto = service.searchSort(cri3);

		String jsonString = JSONArray.fromObject(dto).toString();

		model.addAttribute("production", jsonString);
		model.addAttribute("pageMaker",new PageDTO3(cri3, service.searchGetTotalCount(cri3.getType(), cri3.getKeyword()))); // 여기에다가 count(*) 을
																										// 적용
//		model.addAttribute("switchPage", "../floatSection/search.jsp");

		return "/mainIndex/search";

	}

}