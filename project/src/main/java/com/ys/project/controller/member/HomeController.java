package com.ys.project.controller.member;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ys.project.projectDTO.IndexProductionDTO;
import com.ys.project.service.production.IProductionService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class HomeController {

	private static final Logger log = LoggerFactory.getLogger(HomeController.class);
	private IProductionService service;

	/* @ResponseBody */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login(Model model) throws Exception {
		System.out.println("À£ÄÄ ~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		JSONArray array = new JSONArray();
		
		
		String path = null;
		int pro_num = 0;
		String title = null;
		int price = 0;
		String cate_code = null;
		
		
		List<IndexProductionDTO> list = service.productionJoin();
		for(int i = 0; i < list.size(); i++) {
			JSONObject object = new JSONObject();
			path = list.get(i).getUploadPath() +"\\s_"+list.get(i).getUuid() + "_" + list.get(i).getFileName();
			pro_num = list.get(i).getPro_num();
			title = list.get(i).getTitle();
			price = list.get(i).getPrice();
			cate_code = list.get(i).getCate_code();
			object.put("path", path);
			object.put("pro_num",pro_num);
			object.put("title",title);
			object.put("price",price);
			object.put("cate_code",cate_code);
			
			array.add(object);
			
		}
		IndexProductionDTO dto = new IndexProductionDTO();
		log.info("json °ªµé : " + array.toString());
		model.addAttribute("productions",array.toString());
		
		return "index";
	}

}
