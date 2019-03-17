package com.ys.project;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login(Model model) throws Exception {
		System.out.println("À£ÄÄ ~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		return "index";
	}
	@RequestMapping(value = "/a", method = RequestMethod.GET)
	public String login2(Model model) throws Exception {
		System.out.println("À£ÄÄ ~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		return "login/login";
	}

	@RequestMapping(value = "/b", method = RequestMethod.GET)
	public String login3(Model model) throws Exception {
		System.out.println("À£ÄÄ ~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		return "login/register";
	}

	@RequestMapping(value = "/c", method = RequestMethod.GET)
	public String login4(Model model) throws Exception {
		System.out.println("À£ÄÄ ~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		return "login/sign";
	}


}
