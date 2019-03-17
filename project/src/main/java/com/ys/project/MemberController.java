package com.ys.project;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "member")
public class MemberController {

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model, @RequestParam Map map) throws Exception {

		return "login/login";

	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPost(Model model, @RequestParam Map map) throws Exception {

		return "login/login";

	}


}
