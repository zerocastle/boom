package com.ys.project.app.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ys.project.projectDTO.IndexProductionDTO;
import com.ys.project.service.production.IProductionService;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping(value = "/app/production/**")
/* consum content-type json */
public class AppProductionController {

	private static final Logger log = LoggerFactory.getLogger(AppProductionController.class);

	private IProductionService service;

	// 상품 리스트 불러오기

	@CrossOrigin(origins = "*", maxAge = 3600)
	@GetMapping(value = "/list/{order}/{cate_code}" , produces= {MediaType.APPLICATION_JSON_UTF8_VALUE}
			)
	public List<IndexProductionDTO> getProductionList(@PathVariable("order") String order,
			@PathVariable("cate_code") String cate_code) {
		List<IndexProductionDTO> dto = service.appSort(order, cate_code);
		log.info("왔니?" + order + cate_code);
		return dto;
	}
	


}
