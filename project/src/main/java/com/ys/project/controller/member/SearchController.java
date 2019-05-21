package com.ys.project.controller.member;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.ys.project.projectDTO.Criteria;
import com.ys.project.projectDTO.Criteria3;
import com.ys.project.projectDTO.IndexProductionDTO;
import com.ys.project.service.production.IProductionService;

import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;

@RestController
@AllArgsConstructor
public class SearchController {

	private static final Logger log = LoggerFactory.getLogger(SearchController.class);

	private IProductionService service;

	@GetMapping(value = "/search", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String search(String choose, String keyword, Criteria3 cri) {
		
		log.info("넘오온 값" + keyword + "" + choose);

		List<IndexProductionDTO> dto = service.searchSort(1, 13, choose, keyword);

		return JSONArray.fromObject(dto).toString();

	}

}
