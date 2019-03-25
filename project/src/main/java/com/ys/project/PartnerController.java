package com.ys.project;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ys.project.memberVO.Partner;
import com.ys.project.service.PartnerService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "partner")
public class PartnerController {

	private static final Logger logger = LoggerFactory.getLogger(PartnerController.class);

	private PartnerService service;

	// 파트너 페이지 이동
	@RequestMapping(value = "partnerPage", method = RequestMethod.GET)
	public void partnerRegisterGet(Model model) throws Exception {
		
		logger.info("파트너 레지스터 가입 이동...");
	}

	// 파트너 가입
	@RequestMapping(value = "partnerPage", method = RequestMethod.POST)
	public String partnerRegisterPost(Model model, Partner partner) throws Exception {
		
		logger.info("파트너 레지스터 :" + partner);
		service.partnerRegister(partner);
		return "";
	}

}
