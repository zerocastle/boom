package com.ys.project.controller.member;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.ys.project.projectDTO.IndexProductionDTO;
import com.ys.project.service.production.IProductionService;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
public class SearchController {

	private static final Logger log = LoggerFactory.getLogger(SearchController.class);

	private IProductionService service;
	
	@GetMapping(value = "/search/{pageNum}/{perPage}/{choose}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public void search(@PathVariable("pageNum") int pageNum, @PathVariable("perPage") int perPage,
			@PathVariable("choose") String choose) {
		
		log.info("넘오온 값" + perPage + "" + choose);
		
		List<IndexProductionDTO> dto = service.searchSort(pageNum, perPage, choose);
		

	}

}
