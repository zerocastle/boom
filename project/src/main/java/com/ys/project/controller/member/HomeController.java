package com.ys.project.controller.member;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ys.project.projectDTO.IndexProductionDTO;
import com.ys.project.projectVO.PartnerVO;
import com.ys.project.service.production.IProductionService;
import com.ys.project.service.sellingUpdate.ISellingUpdateService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class HomeController {

	private static final Logger log = LoggerFactory.getLogger(HomeController.class);
	private IProductionService service;

	// 직플파트너 가져오기 위한 서비스 레이어
	private ISellingUpdateService service2;

	/* @ResponseBody */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login(Model model) throws Exception {
		System.out.println("웰컴 ~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

		JSONArray array = new JSONArray();

		String path = null;
		int pro_num = 0;
		String title = null;
		int price = 0;
		String cate_code = null;
		int place_signal = 0;
		String state_msg = null;

		List<IndexProductionDTO> list = service.productionJoin();
		for (int i = 0; i < list.size(); i++) {
			JSONObject object = new JSONObject();
			path = list.get(i).getUploadPath() + "\\s_" + list.get(i).getUuid() + "_" + list.get(i).getFileName();
			pro_num = list.get(i).getPro_num();
			title = list.get(i).getTitle();
			price = list.get(i).getPrice();
			cate_code = list.get(i).getCate_code();
			place_signal = list.get(i).getPlace_signal();
			state_msg = list.get(i).getState_msg();
			object.put("path", path);
			object.put("pro_num", pro_num);
			object.put("title", title);
			object.put("price", price);
			object.put("cate_code", cate_code);
			object.put("place_signal", place_signal);
			object.put("state_msg", state_msg);

			array.add(object);

		}
		IndexProductionDTO dto = new IndexProductionDTO();
		log.info("json 값들 : " + array.toString());
		model.addAttribute("productions", array.toString());

		return "index";
	}

	
	
	// 직플레이스 정보를 얻기 위한 작업
	@ResponseBody
	@GetMapping("/getPartner")
	public List<PartnerVO> directPick(Model model) {
		// TODO Auto-generated method stub

		return service2.directPickList();

	}

}
