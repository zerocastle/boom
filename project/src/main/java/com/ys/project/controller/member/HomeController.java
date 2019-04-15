package com.ys.project.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class HomeController {

	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login(Model model) throws Exception {
		System.out.println("À£ÄÄ ~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		return "index";
	}

}
