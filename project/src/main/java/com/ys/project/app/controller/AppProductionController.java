package com.ys.project.app.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ys.project.projectDTO.IndexProductionDTO;
import com.ys.project.service.production.IProductionService;

import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;

@RestController
@AllArgsConstructor
@RequestMapping(value = "/app/production/**")
/* consum content-type json */
public class AppProductionController {

	private static final Logger log = LoggerFactory.getLogger(AppProductionController.class);

	private IProductionService service;

	// 상품 리스트 불러오기
	@CrossOrigin(origins = "*", maxAge = 3600)
	@GetMapping(value = "/list/{order}/{cate_code}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public List<IndexProductionDTO> getProductionList(@PathVariable("order") String order,
			@PathVariable("cate_code") String cate_code) {
		List<IndexProductionDTO> dto = service.appSort(order, cate_code);
		log.info("왔니?" + order + cate_code);
		return dto;
	}

	// 상품 상세 보기
	@CrossOrigin(origins = "*", maxAge = 3600)
	@GetMapping(value = "/view/{pro_num}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public String productView(@PathVariable("pro_num") int pro_num) {
		log.info("상품 상세보기 : " + pro_num);
		List<Map<String, Object>> list = service.totalFineByPro(pro_num);
		log.info("" + list);
		return JSONArray.fromObject(list).toString();

	}

	// 상품 검색
	@CrossOrigin(origins = "*", maxAge = 3600)
	@GetMapping(value = "/search/{cate_code}/{order}/{keyword}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public String productionSearch(@PathVariable("cate_code") String cate_code, @PathVariable("order") String order,
			@PathVariable("keyword") String keyword) {
		System.out.println(cate_code + "" + order + "" + keyword);
		List<IndexProductionDTO> dto = service.appSearch(cate_code, order, keyword);
		String jsonString = JSONArray.fromObject(dto).toString();
		return jsonString;

	}

}
